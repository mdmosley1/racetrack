classdef track2
    %TRACK1 This is a class for track1
    %   This class was created because it needs its own method for
    %   initializing the nodes to zero
    properties (Constant)
        K = 3; % the basic unit of measurement. Everything is based on K
        d = 10;
    end
    properties (Dependent = true)
        x,y,outside,inside,e1,e2,w,h,w2,h2,s,H,W,nodes,sx,sy,cp
    end
    methods
        % base dimensions of track
        function e2 = get.e2(obj)
            e2 = obj.K;end
        function h = get.h(obj)
            h1 = 3*obj.K;end
        function w = get.w(obj)
            w1 = 5*obj.K;end
        function s = get.s(obj)
            s = 5*obj.K;end
        
        % other dimensions of track
        function e1 = get.e1(obj)
            e1 = 2*obj.e2;end
        function h2 = get.h2(obj)
            h2 = obj.h1 - 2*obj.K;end
        function w2 = get.w2(obj)
            w2 = obj.w1 - 2*obj.K;end
        % for plotting
        function x = get.x(obj)
            x = [obj.d 
                obj.d+2*obj.e2          %x2
                obj.d+3*obj.e2          %x3
                obj.d+4*obj.e2          %x4
                obj.d+6*obj.e2          %x5
                obj.d+obj.w1-2*obj.e2   %x6
                obj.d+obj.w1            %x7
                obj.d+obj.w1+obj.e2     %x8
                obj.d+obj.w1+2*obj.e2   %x9
                obj.d+obj.w1+4*obj.e2   %x10
                ];
        end
%         function y = get.y(obj)
%             y = [obj.d
%                 obj.d + 2*obj.e2
%                 obj.d + 3*obj.e2
%                 obj.d + 3*obj.e2 + obj.h2
%                 obj.d + 2*obj.e2 + obj.h1
%                 obj.d + 2*obj.e2 + obj.h1 + obj.s
%                 
%                 
%                 ]; 
%         end
        function H = get.H(obj)
            H = obj.y(7);
        end
        function W = get.W(obj)
            W = obj.x(6);
        end
        function outside = get.outside(obj)
            outside = [obj.x(1) obj.x(1) obj.x(2) obj.x(5) obj.x(6)...
                obj.x(6) obj.x(5) obj.x(2) obj.x(1);
                obj.y(2) obj.y(6) obj.y(7) obj.y(7) obj.y(6) obj.y(2)...
                obj.y(1) obj.y(1) obj.y(2)];
        end
        function inside = get.inside(obj)
            inside = [obj.x(2) obj.x(2) obj.x(3) obj.x(4) obj.x(5)...
                      obj.x(5) obj.x(4) obj.x(3) obj.x(2);
                      obj.y(3) obj.y(5) obj.y(6) obj.y(6) obj.y(5)...
                      obj.y(3) obj.y(2) obj.y(2) obj.y(3)];
        end
        function sx = get.sx(obj)
            sx = obj.d+obj.e2;
        end
        function sy = get.sy(obj)
            sy = obj.y(4);
        end
        function cp = get.cp(obj)
            cp{1} = [obj.x(5) obj.x(6);obj.y(4) obj.y(4)];
            cp{2} = [obj.x(1) obj.x(2);obj.y(4) obj.y(4)];
        end
        
        % ---------- use setter method to zero out nodes -----------------
        function nodes = get.nodes(obj)
            % initialize the value matrix
            nodes = rand([obj.H+10 obj.W+10]); 
            
            % Make nodes outside and on tracklines zero
            nodes(1:obj.H+10,1:obj.d) = 0; % west of track
            nodes(1:obj.d,1:obj.W+10) = 0; % south of track
            nodes(obj.H:obj.H+10,1:obj.W+10) = 0; % north of track
            nodes(1:obj.H+10,obj.W:obj.W+10) = 0; % east of track
            
            % Make nodes inside track zero
            % horizontal strip
            nodes(obj.y(3):obj.y(5),obj.x(2):obj.x(5)) = 0;
            % vertical strip
            nodes(obj.y(2):obj.y(6),obj.x(3):obj.x(4)) = 0;
            
            % Make nodes zero around Southwest corner
            for m=1:obj.e1+1
                nodes(obj.d+(m-1),obj.d:obj.d+obj.e1+(1-m)) = 0;
            end
            % Northwest corner
            for m=1:obj.e1+1
                nodes(obj.y(6)+(m-1),obj.x(1):obj.x(1)+(m-1)) = 0;
            end
            % Northeast corner
            for m=1:obj.e1+1
                nodes(obj.y(7)-(m-1),obj.x(5)+(m-1):obj.x(6)) = 0;
            end
            % Southeast corner
            for m=1:obj.e1+1
                nodes(obj.y(1)+(m-1),obj.x(5)+(m-1):obj.x(6)) = 0;
            end
        end
    end
end