classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data, blacklist)
            [tree, blacklist] = DecisionTreeMaths.chooseAttribute(data, blacklist);
            lChild = {};
            rChild = {};
            
            lChild = tree.kids{1};
            rChild = tree.kids{2};
            
        % Return a leaf node or a split the data again if not a leaf
        % node
        
            if ID3.checkForLeaf(lChild) == true || ID3.checkForBlacklists(tree, lChild, blacklist) == true
                if ID3.checkForBlacklists(tree, lChild, blacklist) == true
                    leafNode = ID3.getLeafNode(tree, lChild);
                else
                    prediction = unique(lChild{:, width(lChild)});
                    leafNode = DataProcessing.convertToStruct("", [], prediction, tree.attribute, tree.threshold);
                end
                disp(leafNode);
            else
                ID3.Tree(lChild, blacklist);
            end
            
            if ID3.checkForLeaf(rChild) == true || ID3.checkForBlacklists(tree, rChild, blacklist) == true
                
                if ID3.checkForBlacklists(tree, rChild, blacklist) == true
                    leafNode = ID3.getLeafNode(tree, rChild);
                else
                    prediction = unique(rChild{:, width(rChild)});
                    leafNode = DataProcessing.convertToStruct("", [], prediction, tree.attribute, tree.threshold);
                end
                disp(leafNode);
            else
                ID3.Tree(rChild, blacklist);
            end
        end
        
        function isLeafNode = checkForLeaf(child)
            
            labels = child{:, width(child)};
            uniqueValues = unique(labels);
            numberOfUniqueVals = length(uniqueValues);
            if numberOfUniqueVals > 1
                isLeafNode = false;
            else
                isLeafNode = true;
            end
        end
        
        function isPartOfBlacklist = checkForBlacklists(tree, child, blacklist)
            
            featureCol = child{:, tree.attribute};
            colBlacklist = blacklist{:, tree.attribute};
            if ismember(colBlacklist, featureCol)
               isPartOfBlacklist = true;
            else 
                isPartOfBlacklist = false;
            end
        end
        
        function leafNode = getLeafNode(tree, child)
           
            labels = child{:, width(child)};
            prediction = mode(labels);
            leafNode = DataProcessing.convertToStruct("", [], prediction, prediction, tree.threshold);
        end
    end
end