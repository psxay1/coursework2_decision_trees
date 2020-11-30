classdef ID3Helpers
    
    properties
    end
    methods (Static)
        
        function bucketHolder = splitData(featureColumn, labels)
            values = unique(featureColumn);
            for i=1:height(values)
                
                indices = ismember(featureColumn, values(i, :));
                featureBucket = featureColumn(indices, :);
                labelBucket = labels(indices, :);
                filteredTable = [featureBucket, labelBucket];
                bucketHolder{i} = filteredTable;
            end
        end
        
        function entropy=calculateEntropy(subset)
            n_positive = height(subset(subset.yes == 1, :));
            n_negative = size(subset, 1) - n_positive;
            totalSize = n_positive + n_negative;
            p_positive = n_positive/totalSize;
            p_negative = n_negative/totalSize;
            entropy = -(p_positive*log2(p_positive) + p_negative*log2(p_negative));
        end
    end
end