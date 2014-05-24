classdef car
    %CAR This is a car
    %   It has a position, velocity, and acceleration
    
    properties
        pos 
        vel
        acc = [0 0]
        % done is set to one when the car finishes the track
        done = 0
        check = 1
    end
    methods
        function obj = car(F)
            if nargin ~= 0 % Allow nargin == 0 syntax
                
                m = size(F,1);
                n = size(F,2);
                obj(m,n) = car; % Preallocate object array
            end
        end
    end
    
end

