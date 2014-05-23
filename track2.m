classdef track2
    %TRACK1 This is a class for track1
    %   This class was created because it needs its own method for
    %   initializing the nodes to zero
    properties (Constant)
        track_data = setTrackData
    end
    properties (Dependent = true)
        nodes,start,cp
    end
    methods
        function start = get.start(obj)
            start = obj.track_data{3};
        end
        function cp = get.cp(obj)
            cp = obj.track_data{6};
        end
        % ---------- use setter method to zero out nodes -----------------
        function nodes = get.nodes(obj)
            % initialize the value matrix
            nodes = init_nodes(obj.track_data);
        end
    end
end