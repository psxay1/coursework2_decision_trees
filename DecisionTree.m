classdef DecisionTree
   
    properties
%         tree
        node = Node()
    end
    
    methods
        
        function obj = DecisionTree()
            obj.node = struct(obj.node);
        end
        
        function obj = setTreeRoot(obj, root)
            obj.node.root = root;
        end
        
        function obj = updateTree(obj, attributeObj)
            obj.node.op = attributeObj.op;
            obj.node.attribute = attributeObj.attribute;
            obj.node.threshold = attributeObj.threshold;
        end
        
        function tree = addChildren(obj, kidsObject)
            children = kidsObject.kids;
            
            obj = obj.updateCurrentNode(kidsObject);
            
            for i=1:length(children)
                if obj.checkForLeaf(children{i}, kidsObject.blacklist, kidsObject.attribute) == true
                    leafNode = Node.createNode([], "", [], obj.getPrediction(children{i}), kidsObject.attribute, kidsObject.threshold);
                    leafNode = struct(leafNode);
                    obj.node.kids{end+1} = leafNode;
                else
                    internalNode = Node.createNode(obj.node.root, kidsObject.op, [], NaN, kidsObject.attribute, kidsObject.threshold);
                    internalNode = struct(internalNode);
                    obj.node.kids{end+1} = internalNode;
                end
            end
            tree = obj.node;
        end
    end
    
%     methods
%         
%         function obj = DecisionTree()
%             disp(obj);
%         end
%         
%         
%         function insert(obj, node, children)
%             
%             for i=1:length(children)
%                 if DecisionTree.checkForLeaf(children{i}) == true
%                     disp("grsohsdiojbds"); 
%                 else
%                     
%                 end
%                     
%             end
%             
%         end
%         
%     end
%     

    methods (Access = 'private')
        
        function obj = updateCurrentNode(obj, kidsObject)
            obj.node.op = kidsObject.op;
            obj.node.attribute = kidsObject.attribute;
            obj.node.threshold = kidsObject.threshold;
        end
        
        function insert(obj, node)
            
        end
        
        function isLeafNode = checkForLeaf(~, child, blacklist, attribute)
            labels = child{:, width(child)};
            uniqueValues = unique(labels);
            numberOfUniqueVals = length(uniqueValues);
            if numberOfUniqueVals > 1
                isLeafNode = false;
            else
                isLeafNode = true;
            end
            featureCol = child{:, attribute};
            colBlacklist = blacklist{:, attribute};
            if ismember(colBlacklist, featureCol)
               isPartOfBlacklist = true;
            else 
                isPartOfBlacklist = false;
            end
            isLeafNode = isLeafNode || isPartOfBlacklist;
        end
        
        function prediction = getPrediction(~, child)
            labels = child{:, width(child)};
            prediction = mode(labels);
        end
        
    end

    methods (Static)
        
        
    end
    
end