function nodes = init_nodes_1(outside,inside,H,W)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% initialize random matrix of nodes
nodes = rand([H+10 W+10]);

xout = outside(1,:);
yout = outside(2,:);
xin = inside(1,:);
yin = inside(2,:);

%% Plotting
sz = size(xout);sz = sz(2)-1;
% build outside track lines
for i = 1:sz
    tx(i,:) = [xout(i) xout(i+1)];
    ty(i,:) = [yout(i) yout(i+1)];
end
% build inside track lines
for i = 1:sz
    tx(i+sz,:) = [xin(i) xin(i+1)];
    ty(i+sz,:) = [yin(i) yin(i+1)];
end
% plot track
th = zeros(sz*2,1);
for it = 1:sz
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end

%% get xy coords in right format for inhull 
for i = 1:sz
    trackout(i,:) = [xout(i) yout(i)];
    trackin(i,:) = [xin(i) yin(i)] ;
end

%% initialize points for matrix
testpoints = zeros(1750,2); i = 1;
for a = 1:W+10
    for b = 1:H+10
        testpoints(i,:) = [a b];
        i = i + 1;
    end
end
inOuterHull = inhull(testpoints,trackout); i = 1;
inInnerHull = inhull(testpoints,trackin); i = 1;


%% zero out nodes outside of outer track or inside inner track
for a = 1:W+10
    for b = 1:H+10
        if (inOuterHull(i) == 0 || inInnerHull(i) == 1)
            nodes(b,a) = 0; % b,a backwards because nodes(rows,columns)
            plot(a,b,'r*');
        end
        i = i + 1;
    end
end
end

