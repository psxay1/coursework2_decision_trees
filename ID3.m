classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data)
            [children, gain, columnIndex] = DecisionTreeMaths.chooseAttribute(data);
            lChild = children{1};
            rChild = children{2};
            if checkForLeaf(lchild) == true
                1;
            elseif checkForLeaf(rchild) == true
                1;
            else
                ID3.Tree(lChild);
                ID3.Tree(rChild);
            end
        end
        
        function isLeafNode = checkForLeaf(child)
            
            labels = child(:,end);
            uniqueValues = unique(labels);
            numberOfUniqueVals = length(uniqueValues);
            if numberOfUniqueVals > 1
                isLeafNode = false;
            else
                isLeafNode = true;
            end
        end
    end
end