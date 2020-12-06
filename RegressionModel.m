classdef RegressionModel
    
    properties
    end
    methods (Static)
        
        function [informationGain, children, splitValues] = regression(tabularData, i)
            
            children = ID3Helpers.splitNumData(i, tabularData);
            [informationGain, ~] = DecisionTreeMaths.calculateInformationGain(children);
            splitValues = [];
        end
        
        function value = setPredictionValueForEntropy()
           value = 1; 
        end
        
    end
end