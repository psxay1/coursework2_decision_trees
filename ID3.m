classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data)
            [children, gain, columnIndex] = DecisionTreeMaths.chooseAttribute(data);
            if gain == 0
                return
            end
            disp(gain);
            disp(children);
            for childIndex=1:length(children)
                ID3.plotGraph(children{childIndex})
                ID3.Tree(children{childIndex});
            end
        end
        
        function plotGraph(data)
            for i=1:width(data)
                plot(data{:,i}, 'r.', 'MarkerSize', 20);
                disp("*******");
            end
        end
    end
end