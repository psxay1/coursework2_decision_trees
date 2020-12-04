classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data)
            tree = DecisionTreeMaths.chooseAttribute(data);
            lChild = {};
            rChild = {};
            
            for i=1:length(tree.kids)
                if i == 1
                    lChild = tree.kids{i};
                else
                    rChild = tree.kids{2};
                end
            end
            
            disp("**********")
            
        % Return a leaf node or a split the data again if not a leaf
        % node
            if ID3.checkForLeaf(lChild) == true
                prediction = unique(lChild.y);
                leafNode = DataProcessing.convertToStruct("", [], prediction, tree.attribute, tree.threshold);
                disp(leafNode);
            else
                ID3.Tree(lChild);
            end
            
            if ID3.checkForLeaf(rChild) == true
                prediction = unique(rChild.y);
                leafNode = DataProcessing.convertToStruct("", [], prediction, tree.attribute, tree.threshold);
                disp(leafNode);
            else
                ID3.Tree(rChild);
            end
        end
        
        function isLeafNode = checkForLeaf(child)
            
            labels = child.y;
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