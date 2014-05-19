%% test.m

x1 = 1:5;
x2 = x1;

y1 = [5 4 3 2 1];
y2 = [1 2 3 4 5];

X = [x1 fliplr(x2)];
Y = [y1 fliplr(y2)];

fill(X,Y,'g')

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