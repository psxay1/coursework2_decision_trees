classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        
        % calculates Information Gain for categorical data
        function informationGain = calculateInformationGain(children)
            S = 0;
            weightedGain = 0;
            n_positive = 0;
            n_negative = 0;
            for i=1:length(children)
                S = S + height(children{i});
            end
            
            for index=1:length(children)
                child = children{index};
                [Hsv, positives, negatives] = ID3Helpers.calculateEntropy(child);
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
        
        function [bestChildren, bestGain, columnIndex] = chooseAttribute(tabularData)
            % This would give the column with best gain
            bestGain = 0;
            columnIndex = 0;
            bestChildren = {};
            for i=1:width(tabularData)-1
                % class for a categorical column would be table (because of
                % onehotencoding) and for numerical it would double
                if class(tabularData{:,i}) == "table"
                    children = ID3Helpers.splitData(i, tabularData);
                    informationGain = DecisionTreeMaths.calculateInformationGain(children);
                else
                    children = ID3Helpers.splitNumData(i, tabularData);
                    informationGain = DecisionTreeMaths.calculateInformationGain(children);
                end
                if informationGain > bestGain
                    bestGain = informationGain;
                    columnIndex = i;
                    bestChildren = children;
                end
            end
        end
    end
end