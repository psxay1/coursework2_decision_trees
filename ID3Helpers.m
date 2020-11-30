classdef ID3Helpers
    
    properties
    end
    methods (Static)
        
        function bucketHolder = splitData(featureColumn, labels)
            values = unique(featureColumn);
            disp(featureColumn)
            colCounter = 1;
            for i=1:height(values)
                
                indices = ismember(featureColumn, values(i, :));
                featureBucket = featureColumn(indices, :);
                labelBucket = labels(indices, :);
                filteredTable = [featureBucket, labelBucket];
                bucketHolder{i} = [filteredTable];
%                 for row=1:height(featureColumn)
%                     if isequal(values(i, :), featureColumn(row, :))
%                             disp('dsfhggsf')
%                            %children(i, row) = [featureColumn(row, :), labels(row, :)];
%                            %disp(children{i, row});
%                            children{i, colCounter} = [table2struct(featureColumn(row, :)), table2struct(labels(row, :))];
%                            colCounter = colCounter + 1;
%                     end
%                 end
            end
        end
    end
end