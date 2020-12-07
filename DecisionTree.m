classdef DecisionTree
   
    properties
%         tree
        node = Node()
    end
    
    methods
        
        % constructor
        function obj = DecisionTree()
            obj.node = struct(obj.node);
        end
        
        % add table data to current node in tree
        function obj = setTreeRoot(obj, data)
            obj.node.data = data;
        end
        
        
        % adding children to the current node in the tree
        function tree = addChildren(obj, kidsObject)
            children = kidsObject.kids;
            
            obj = obj.updateCurrentNode(kidsObject);
            
            for i=1:length(children)
                if obj.checkForLeaf(children{i}, kidsObject.blacklist, kidsObject.attribute) == true
                    leafNode = Node.createNode([], "", [], obj.getPrediction(children{i}), kidsObject.attribute, kidsObject.threshold);
                    % conversion to struct as per cw pdf
                    leafNode = struct(leafNode);
                    obj.node.kids{end+1} = leafNode;
                else
                    internalNode = Node.createNode(children{i}, kidsObject.op, [], NaN, kidsObject.attribute, kidsObject.threshold);
                    % conversion to struct as per cw pdf
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
        
        % update properties of the current node in the tree
        function obj = updateCurrentNode(obj, kidsObject)
            obj.node.op = kidsObject.op;
            obj.node.attribute = kidsObject.attribute;
            obj.node.threshold = kidsObject.threshold;
        end
        
        % checking for leaf node
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
        
        % getting predicted value for leaf nodes
        function prediction = getPrediction(~, child)
            labels = child{:, width(child)};
            prediction = mode(labels);
        end
        
    end
    
    % static methods in the class would be defined here
    methods (Static)
        
        
    end
    
end