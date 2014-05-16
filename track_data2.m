clear;clc;
% ---------------------------- Track Dims -------------------------------
x1=10;x2=12;x3=13;x4=14;x5=16;x6=18;x7=20;x8=21;x9=22;x10=24;
y1=10;y2=12;y3=13;y4=15;y5=16;y6=19;y7=20;y8=22;y9=23;y10=26;y11=27;
y12=29;y13=30;y14=32;

% ---------------------------- Track Lines -----------------------------
xx = [x1 x1 x4 x4 x1 x1 x2 x9 x10 x10 x7 x7 x10 x10 x9 x2 x1]
yy = [y2 y5 y7 y8 y10 y13 y14 y14 y13 y10 y8 y7 y5 y2 y1 y1 y2]

for i = 1:16
    tx(i,:) = [xx(i) xx(i+1)]
    ty(i,:) = [yy(i) yy(i+1)]
end

% Plot track
th = zeros(16);
for it = 1:16
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end