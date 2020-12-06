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
        
        function [tree, blacklist] = chooseAttribute(tabularData, blacklist)
            % This would give the column with best gain
            bestGain = 0;
            columnIndex = 0;
            bestChildren = {};
            
            for i=1:width(tabularData)-1
                
                [informationGain, children, splitValues] = RegressionModel.regression(tabularData, blacklist, i);
%                 [informationGain, children] = ClassificationModel.classification(tabularData, i);
                splitValues = [];
                
                if informationGain > bestGain
                    bestGain = informationGain;
                    columnIndex = i;
                    bestChildren = children;
                    blacklist{i} = vertcat(splitValues);
                end
            end
            tree = DataProcessing.convertToStruct(tabularData.Properties.VariableNames{columnIndex}, bestChildren, NaN, columnIndex, bestGain);
        end
    end
end