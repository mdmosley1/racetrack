classdef track1
    %TRACK1 This is a class for track1
    %   This class was created because it needs its own method for
    %   initializing the nodes to zero
    properties (Constant)
        K = 3; % the basic unit of measurement. Everything is based on K
        d = 10;
        track_path = setTrackPath1
    end
    properties (Dependent = true)
        H,W,nodes,sx,sy,cp
    end
    methods          
        % ---------- use getter method to zero out nodes ----------------
        function nodes = get.nodes(obj)
            % initialize the value matrix            
            nodes = init_nodes_1(obj.track_path,obj.H,obj.W);
        end
    end
end