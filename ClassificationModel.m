classdef ClassificationModel
    
    properties
    end
    methods (Static)
        
        function [informationGain, children] = classification(tabularData, i)
            
            children = ID3Helpers.splitNumData(i, tabularData);
            [informationGain, ~] = DecisionTreeMaths.calculateInformationGain(children);
            
        end
        
        function value = setPredictionValueForEntropy(data)
            uniqueValues = unique(data{:, width(data)});
            value = round(sum(uniqueValues)/height(uniqueValues));
        end
    end
end