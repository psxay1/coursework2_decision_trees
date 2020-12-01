classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        
        % calculates Information Gain
        function informationGain = calculateInformationGain(featureColumn, children)
            S = height(featureColumn.data);
            weightedGain = 0;
            for index=1:length(children)
                child = children{index};
                Hsv = ID3Helpers.calculateEntropy(child);
                Sv = height(child.data);
                % Sv/S[H(Sv)]
                weightedEntropy = (Sv/S)*Hsv;
                % Adding weighted entropies of the children nodes i.e.
                % weighted gain
                weightedGain = weightedGain + weightedEntropy;
            end
            % Entropy of the parent node
            Hs= ID3Helpers.calculateEntropy(featureColumn);
            informationGain = Hs - weightedGain;
        end
        
        function chooseAttribute(tableData)
            % This would give the column with best gain
            bestGain = 0;
            index = 0;
            for i=1:length(tableData)
                if tableData{i}.dataType == "categorical"
                    children = ID3Helpers.splitData(tableData{i});
                    informationGain = DecisionTreeMaths.calculateInformationGain(tableData{i}, children);
                    disp(informationGain);
                    disp(i);
                    if informationGain > bestGain
                        bestGain = informationGain;
                        index = i;
                    end
                end
            end
%             disp("********************BEST GAIN********************")
%             disp(bestGain);
%             disp(index);
        end
    end
end