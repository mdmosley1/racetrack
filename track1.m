classdef track1
    %TRACK1 This is a class for track1
    %   This class was created because it needs its own method for
    %   initializing the nodes to zero
    
    properties (Constant)
        e2 = 3; e1 = 2*e2; w = 4*e2; h = 8*e2; h2 = h-2*e2; w2 = w - 2*e2;
        d = 10; % distance from axis
        H = 2*e1+h+d; W =2*e1+w+d; % height and width of the whole grid
        sx = e2+d; sy = e1+e2+h2/2+d; % start position
        
        % use intermediary values for track data: h1,h2,h3...H for 
        % different y-values. w1,w2,w3...W for different x-values
        x1 = d; x2 = d+e1; x3 = d+e1+e2; x4 = d+e1+e2+w2; x5 = d+e1+w; 
        x6 = W;
        y1 = d; y2 = d+e1; y3 = d+e1+e2; y4 = d+e1+h/2; y5 = d+e1+e2+h2;
        y6 = d+e1+h; y7 = H;
        
    end
    properties
        % track dimensions
        
        
        % make path for outside track
        outside = [x1 x1 x2 x5 x6 x6 x5 x2 x1; 
                   y2 y6 y7 y7 y6 y2 y1 y1 y2];
        % make path for inside track
        inside = [x2 x2 x3 x4 x5 x5 x4 x3 x2;
                  y3 y5 y6 y6 y5 y3 y2 y2 y3];
        
        % other
        checkpoint = [x1 x2 x5 x6; y4 y4 y4 y4];
        start
        nodes
    end
    methods
        function obj = set.nodes(obj,~)
            obj.nodes = rand([H+10 W+10]); % initialize the value matrix
            
            % Make nodes outside and on tracklines zero
            obj.nodes(1:H+10,1:d) = 0; % west of track
            obj.nodes(1:d,1:W+10) = 0; % south of track
            obj.nodes(H:H+10,1:W+10) = 0; % north of track
            obj.nodes(1:H+10,W:W+10) = 0; % east of track
            
            % Make nodes inside track zero
            obj.nodes(e1+e2+d:e1+e2+h2+d,e1+d:e1+2*e2+w2+d,:) = 0;
            obj.nodes(e1+d:e1+h+d,e1+e2+d:e1+e2+w2+d,:) = 0;
            
            % Make nodes around corner zero Southwest corner
            for m=1:e1+1
                obj.nodes(d+(m-1),d:d+e1+(1-m)) = 0;
            end
            % Northwest corner
            for m=1:e1+1
                obj.nodes(d+e1+h+(m-1),d:d+e1-(e1-m)) = 0;
            end
            % Northeast corner
            for m=1:e1+1
                obj.nodes(y7-(m-1),x5+(m-1):x6) = 0;
            end
            % Southeast corner
            for m=1:e1+1
                obj.nodes(y1+(m-1),x5+(m-1):x6) = 0;
            end
        end
        
    end
end