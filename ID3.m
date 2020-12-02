classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data)
            splitColumns = [];
            [children, gain, columnIndex] = DecisionTreeMaths.chooseAttribute(data, []);
            splitColumns = splitColumns + columnIndex;
            for childIndex=1:length(children)
                 [children, gain, columnIndex] = Tree(children{childIndex});
            end
        end
    end
end