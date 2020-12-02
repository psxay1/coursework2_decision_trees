classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data)
            [children, gain, columnIndex] = DecisionTreeMaths.chooseAttribute(data);
            disp(gain);
            disp(children);
            for childIndex=1:length(children)
                ID3.Tree(children{childIndex});
            end
        end
    end
end