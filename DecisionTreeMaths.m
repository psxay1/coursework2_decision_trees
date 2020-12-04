classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        
        % calculates Information Gain for categorical data
        function [informationGain, childEntropies] = calculateInformationGain(children)
            S = 0;
            weightedGain = 0;
            n_positive = 0;
            n_negative = 0;
            childEntropies = [];
            for i=1:length(children)
                S = S + height(children{i});
            end
            
            for index=1:length(children)
                child = children{index};
                [Hsv, positives, negatives] = ID3Helpers.calculateEntropy(child);
                
                childEntropies(end+1) = horzcat(Hsv);
                
                n_positive = n_positive + positives;
                n_negative = n_negative + negatives;
                Sv = height(child);
                % Sv/S[H(Sv)]
                weightedEntropy = (Sv/S)*Hsv;
                % Adding weighted entropies of the children nodes i.e.
                % weighted gain
                weightedGain = weightedGain + weightedEntropy;
            end
            
            % Entropy of the parent node
            Hs= ID3Helpers.entropy(n_positive, n_negative);
            informationGain = Hs - weightedGain;
            
        end
        
        function tree = chooseAttribute(tabularData)
            % This would give the column with best gain
            bestGain = 0;
            columnIndex = 0;
            bestChildren = {};
            for i=1:width(tabularData)-1
                % class for a categorical column would be table (because of
                % onehotencoding) and for numerical it would double
                categoricalDataCheck = i==2 || i==3 || i==4 || i==5 || i==7 || i==8 || i==9 || i==11 || i==16;
                if categoricalDataCheck
                    [children, values] = ID3Helpers.splitData(i, tabularData);
                    [informationGain, childEntropies] = DecisionTreeMaths.calculateInformationGain(children);
                    % Get  value of the child attribute with max gain for
                    % categorical data
                    minEntropy = min(childEntropies);
                    valueIndices = find(childEntropies==minEntropy);
                    bestSplitValues = values(valueIndices);
                    if length(childEntropies) == height(bestSplitValues)
                        bestSplitValues = bestSplitValues(1);
                    end
                    children = {};
                    children{1} = horzcat(tabularData(ismember(tabularData{:,i}, bestSplitValues), :));
                    children{2} = horzcat(tabularData(~ismember(tabularData{:,i}, bestSplitValues), :));
                else
                    children = ID3Helpers.splitNumData(i, tabularData);
                    [informationGain, ~] = DecisionTreeMaths.calculateInformationGain(children);
                    
                end
                if informationGain > bestGain
                    bestGain = informationGain;
                    columnIndex = i;
                    bestChildren = children;
                end
            end
            tree = DataProcessing.convertToStruct(tabularData.Properties.VariableNames{columnIndex}, bestChildren, NaN, columnIndex, bestGain);
        end
    end
end