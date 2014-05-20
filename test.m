%%
clc;clear;

a = track1;

x1 = a.inside(1,:);
y1 = a.inside(2,:);

x2 = a.outside(1,:);
y2 = a.outside(2,:);

X = [x1 fliplr(x2)];
Y = [y1 fliplr(y2)];

fill(X,Y,'g')

h = findobj('Type','patch')

ishandle(h)

%% test inhull function
clc;clear

a = track1;

x = a.outside(1,:);
y = a.outside(2,:);

sz = size(x);sz = sz(2)-1;

% get xy coords
for i = 1:sz
    track(i,:) = [x(i) y(i)];
end

% build outside track lines
for i = 1:sz
    tx(i,:) = [x(i) x(i+1)];
    ty(i,:) = [y(i) y(i+1)];
end

% plot track
for it = 1:sz
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end
testpoints = zeros(1750,2); i = 1;
for a = 1:35
    for b = 1:50
        testpoints(i,:) = [a b];
        i = i + 1;
    end
end
in = inhull(testpoints,track)

i = 1;
% plot result
for a = 1:35
    for b = 1:50
        if (in(i) == 1)
            plot(a,b,'r*')
        end
        i = i + 1;
    end
end








