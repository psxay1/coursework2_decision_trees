classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        
        % calculates Information Gain for categorical data
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
        
        % calculates Information Gain for numerical data
        function columnParameters = getColumnSplit(data)
            bestColumnGain = 0;
            bestSplitIndex = 0;
            labels = data.labels;
            featureColumn = data.data;
            [featureColumn, sortIndex] = sort(featureColumn, 'ascend');
            S = height(labels);
            Hs = ID3Helpers.calculateEntropyNumeric(labels);
            labels = labels(sortIndex);
            featureTranspose = featureColumn.';
            averageFeatureValues = mean([featureTranspose(1:end-1);featureTranspose(2:end)]);
            averageFeatureValues = averageFeatureValues.';
            for i=1:height(averageFeatureValues)
                lessThanAvgFeatures = featureColumn(featureColumn<=averageFeatureValues(i,:));
                lessThanEndIndex = height(lessThanAvgFeatures);
                
                lessThanAvgLabels = labels(1:lessThanEndIndex);
                greaterThanAvgLabels = labels(lessThanEndIndex+1:end);
                
                SvLT = height(lessThanAvgLabels);
                SvGT = height(greaterThanAvgLabels);
                % ∑ Sv/S[H(Sv)]
                weightedGain = (SvLT/S)*(ID3Helpers.calculateEntropyNumeric(lessThanAvgLabels)) + (SvGT/S)*ID3Helpers.calculateEntropyNumeric(greaterThanAvgLabels);
                
                informationGain = Hs - weightedGain;
                if informationGain > bestColumnGain
                    bestColumnGain = informationGain;
                    bestSplitIndex = lessThanEndIndex;
                end
            end
            splitData = ID3Helpers.splitNumericData(featureTranspose, labels, bestSplitIndex);
            bestSplitValue = averageFeatureValues(bestSplitIndex);
            columnParameters = [splitData, bestSplitValue, bestColumnGain];
        end
        
        function [children, bestGain] = chooseAttribute(tableData)
            % This would give the column with best gain
            bestGain = 0;
            columnIndex = 0;
            bestChildren = {};
            for i=1:length(tableData)
                if tableData{i}.dataType == "categorical"
                    children = ID3Helpers.splitData(tableData{i});
                    informationGain = DecisionTreeMaths.calculateInformationGain(tableData{i}, children);
                else
                    columnData = DecisionTreeMaths.getColumnSplit(tableData{i});
                    children = columnData(1:2);
                    informationGain = columnData{4};
                end
                if informationGain > bestGain
                    bestGain = informationGain;
                    columnIndex = i;
                    disp(columnIndex)
                    bestChildren = children;
                end
            end
            disp(bestGain);
            disp(columnIndex);
            disp(bestChildren);
        end
    end
end