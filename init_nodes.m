function nodes = init_nodes(track_data,H,W)
%INIT_NODES Summary of this function goes here
%   Detailed explanation goes here

% Unpack information from track_path
inside = track_data{1};
outside = track_data{2};
start = track_data{3};
H = track_data{4};
W = track_data{5};
cp = track_data{6};

% initialize random matrix of nodes
nodes = rand([H+10 W+10]);

xout = outside(1,:);
yout = outside(2,:);
xin = inside(1,:);
yin = inside(2,:);

sz = size(xout);sz = sz(2)-1;

%% get xy coords in right format for inhull function
for i = 1:sz
    trackout(i,:) = [xout(i) yout(i)];
    trackin(i,:) = [xin(i) yin(i)] ;
end

%% initialize testpoints
testpoints = zeros(1750,2); i = 1;
for a = 1:W+10
    for b = 1:H+10
        testpoints(i,:) = [a b];
        i = i + 1;
    end
end
inOuterHull = inhull(testpoints,trackout);
inInnerHull = inhull(testpoints,trackin); i = 1;


%% zero out nodes outside of outer track or inside inner track
for a = 1:W+10
    for b = 1:H+10
        if (inOuterHull(i) == 0 || inInnerHull(i) == 1)
            nodes(b,a) = 0; % b,a backwards because nodes(rows,columns)
        end
        i = i + 1;
    end
end
end

