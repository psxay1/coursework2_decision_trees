classdef RegressionModel
    
    properties
    end
    methods (Static)
        
        function [informationGain, children, splitValues] = regression(tabularData, blacklist, i)
            categoricalDataCheck = i==2 || i==3 || i==4 || i==5 || i==7 || i==8 || i==9 || i==11 || i==16;
            if categoricalDataCheck
                [children, values] = ID3Helpers.splitData(i, tabularData, blacklist);
                [informationGain, childEntropies] = DecisionTreeMaths.calculateInformationGain(children);
                % Get  value of the child attribute with max gain for
                % categorical data
                minEntropy = min(childEntropies);
                valueIndices = find(childEntropies==minEntropy);
                splitValues = values(valueIndices);
                if length(childEntropies) == height(splitValues)
                    splitValues = splitValues(1);
                end
                children = {};
                children{1} = horzcat(tabularData(ismember(tabularData{:,i}, splitValues), :));
                children{2} = horzcat(tabularData(~ismember(tabularData{:,i}, splitValues), :));
            else
                children = ID3Helpers.splitNumData(i, tabularData);
                [informationGain, ~] = DecisionTreeMaths.calculateInformationGain(children);
                splitValues = [];
            end
        end
        
        function value = setPredictionValueForEntropy()
           value = 1; 
        end
        
    end
end