classdef Children
    
   properties
       lChild
       rChild
   end
   
   methods
       
       function obj = Children(children)
           obj = obj.addChildren(children);
       end
   end
   
   methods (Access = 'private')
       
       function obj = addChildren(obj, children)
           obj.lChild = children{1};
           obj.rChild = children{2};
       end
   end
end