function nodes = init_nodes_1(outside,inside,H,W)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% initialize random matrix of nodes
nodes = rand([H+10 W+10]);

xout = outside(1,:);
yout = outside(2,:);

sz = size(xout);sz = sz(2)-1;

% get xy coords in right format
for i = 1:sz
    track(i,:) = [xout(i) yout(i)];
end

% build outside track lines
for i = 1:sz
    tx(i,:) = [xout(i) xout(i+1)];
    ty(i,:) = [yout(i) yout(i+1)];
end

% plot track
for it = 1:sz
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end

testpoints = zeros(1750,2); i = 1;

for a = 1:W+10
    for b = 1:H+10
        testpoints(i,:) = [a b];
        i = i + 1;
    end
end
in = inhull(testpoints,track); i = 1;

%zero out nodes outside of track
for a = 1:W+10
    for b = 1:H+10
        if (in(i)==0)
            nodes(a,b) = 0;
        end
        i = i + 1;
    end
end

%zero out nodes inside of track

end

