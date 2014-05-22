function nodes = init_nodes(track_data)
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
    hull6(i,:) = [xout(i) yout(i)];
end
for i = 2:9
    hull1(i-1,:) = [xin(i) yin(i)] ;
end
for i = 10:17
    hull2(i-9,:) = [xin(i) yin(i)]
end

hull3 = [xin(1) yin(1)
    xin(2) yin(2)
    xin(9) yin(9)
    xin(10) yin(10)];

hull4 = [xout(1) yout(1)
    xout(2) yout(2)
    xout(3) yout(3)
    xout(16) yout(16)];

for i = 8:11
    hull5(i-7,:) = [xout(i) yout(i)]    
end

%% initialize testpoints
testpoints = zeros(1750,2); i = 1;
for a = 1:W+10
    for b = 1:H+10
        testpoints(i,:) = [a b];
        i = i + 1;
    end
end
inHull1 = inhull(testpoints,hull1);
inHull2 = inhull(testpoints,hull2);
inHull3 = inhull(testpoints,hull3);
inHull4 = inhull(testpoints,hull4);
inHull5 = inhull(testpoints,hull5);
inHull6 = inhull(testpoints,hull6);

%% zero out nodes outside of outer track or inside inner track
i = 1;
for a = 1:W+10
    for b = 1:H+10
        if (inHull6(i) == 0 || inHull1(i) == 1 || inHull2(i) == 1 ...
            || inHull3(i) == 1 || inHull4(i) == 1 || inHull5(i) == 1)
            nodes(b,a) = 0; % b,a backwards because nodes(rows,columns)
        end
        i = i + 1;
    end
end
end

