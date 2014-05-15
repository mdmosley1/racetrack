classdef thing
   properties
      Value
   end
   methods
      function obj = thing(F)
         if nargin ~= 0 % Allow nargin == 0 syntax
             
            m = size(F,1);
            n = size(F,2);
            obj(m,n) = thing; % Preallocate object array
            for i = 1:m
               for j = 1:n
                  obj(i,j).Value = F(i,j);
               end
            end
            
         end
      end
   end
end