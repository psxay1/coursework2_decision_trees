classdef ID3
    
    properties
    end
    
    methods (Static)
        
        function Tree(data, blacklist, tree)
            % bestSplit = 2 children, best information gain, the name and
            % index of the column on which the data was split, updated
            % blacklist
            bestSplit = DecisionTreeMaths.chooseAttribute(data, blacklist);
            
            tree = tree.addChildren(bestSplit);
            
            
            
            
            
            
            
            % this code can be ignored after completing implementation of
            % tree structure
            %
            %
            %
            %
            %
            %
            % All this is done inside DecisionTree.m
            lChild = {};
            rChild = {};
            
            lChild = bestSplit.kids{1};
            rChild = bestSplit.kids{2};
            
            if ID3.checkForLeaf(lChild) == true || ID3.checkForBlacklists(bestSplit, lChild, blacklist) == true
                if ID3.checkForBlacklists(bestSplit, lChild, blacklist) == true
                    leafNode = ID3.getLeafNode(bestSplit, lChild);
                else
                    prediction = unique(lChild{:, width(lChild)});
                    leafNode = DataProcessing.convertToStruct("", [], prediction, bestSplit.attribute, bestSplit.threshold);
                end
                disp(leafNode);
            else
                ID3.Tree(lChild, blacklist);
            end
            
            if ID3.checkForLeaf(rChild) == true || ID3.checkForBlacklists(bestSplit, rChild, blacklist) == true
                
                if ID3.checkForBlacklists(bestSplit, rChild, blacklist) == true
                    leafNode = ID3.getLeafNode(bestSplit, rChild);
                else
                    prediction = unique(rChild{:, width(rChild)});
                    leafNode = DataProcessing.convertToStruct("", [], prediction, bestSplit.attribute, bestSplit.threshold);
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
        
        function isPartOfBlacklist = checkForBlacklists(bestSplit, child, blacklist)
            
            featureCol = child{:, bestSplit.attribute};
            colBlacklist = blacklist{:, bestSplit.attribute};
            if ismember(colBlacklist, featureCol)
               isPartOfBlacklist = true;
            else 
                isPartOfBlacklist = false;
            end
        end
        
        function leafNode = getLeafNode(bestSplit, child)
           
            labels = child{:, width(child)};
            prediction = mode(labels);
            leafNode = DataProcessing.convertToStruct("", [], prediction, bestSplit.attribute, bestSplit.threshold);
        end
    end
end