function value = init_nodes
%ZERO_NODES This function makes nodes outside track zero
%   Initialize value matrix for node grid (Each particle j gets its own HxW
%   grid). The nodes outside the track have to be zero so that cars dont go
%   out of bounds.

load track_data;

value = rand([H+10 W+10]); % initialize the value matrix

% Make nodes outside and on tracklines zero
value(1:H+10,1:d) = 0; % west of track
value(1:d,1:W+10) = 0; % south of track
value(H:H+10,1:W+10) = 0; % north of track
value(1:H+10,W:W+10) = 0; % east of track

% Make nodes inside track zero
value(e1+e2+d:e1+e2+h2+d,e1+d:e1+2*e2+w2+d,:) = 0;
value(e1+d:e1+h+d,e1+e2+d:e1+e2+w2+d,:) = 0;

% Make nodes around corner zero Southwest corner
for m=1:e1+1
    value(d+(m-1),d:d+e1+(1-m)) = 0;
end
% Northwest corner
for m=1:e1+1
    value(d+e1+h+(m-1),d:d+e1-(e1-m)) = 0;
end
% Northeast corner
for m=1:e1+1
    value(y7-(m-1),x5+(m-1):x6) = 0;
end
% Southeast corner
for m=1:e1+1
    value(y1+(m-1),x5+(m-1):x6) = 0;
end
end

