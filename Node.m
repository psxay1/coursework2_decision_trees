classdef Node
    
    properties
        % current node attributes
        op
        kids
        prediction
        attribute
        threshold
    end
    
    properties (SetAccess ='private', GetAccess = 'private')
        % hold the table data for the current node
       data
    end
    
    methods
        % constructor
        function obj = Node()
        end
        
    end
    
    % Static methods
    methods (Static)
        
        % creating a new node object
        function node = createNode(data, op, kids, prediction, attribute, threshold)
            
            node = Node();
            node.data = data;
            node.op = op;
            node.kids = kids;
            node.prediction = prediction;
            node.attribute = attribute;
            node.threshold = threshold;
            node.data = data;
%             node.children = Node.setChildren(children);
        end
        
    end
    
    % static private methods
    methods (Access = 'private', Static)
        
        function children = setChildren(childNodes)
            children = Children(childNodes);
        end
        
    end
    
    % public methods
%     methods
%         
%         function obj = Node()
%             obj.node = struct('root', [], 'op', "", 'kids', [], 'prediction', NaN, 'threshold', NaN);
%         end
%         
%         function [obj, node] = setParent(obj, parentNode)
%             obj.node.root = parentNode;
%             node = obj.node;
%         end
%     end
end