classdef ID3Helpers
    
    properties
    end
    methods (Static)
        
        function children = splitData(feature, labels)
            values = unique(feature);
            for i=1:height(values)
                for j=1:height(feature)
                    disp(values(i, :))
                    disp(feature(j, :))
                    if isequal(values(i, :), feature(j, :))
                           children{i, j} = [feature(j, :), labels(j, :)];
                    end
                end 
            end
        end
    end
end