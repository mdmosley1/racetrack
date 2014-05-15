classdef chrom
    %CHROM Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % zero out nodes in value matrix that are outside of track
        value
        % each chomosome has a copy of value for the purpose of zeroing
        % out nodes that particle should not revisit.
        COPY_value
        % initialize fitness to some high value
        fit
    end
    
    methods
        function obj = chrom(F)
            if nargin ~= 0 % Allow nargin == 0 syntax
                
                m = size(F,1);
                n = size(F,2);
                obj(m,n) = chrom; % Preallocate object array
                for i = 1:m
                    for j = 1:n
                        obj(i,j).fit = F(i,j);
                    end
                end
                
            end
        end
    end
    
end