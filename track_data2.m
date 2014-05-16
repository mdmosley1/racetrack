clear;clc;
% ---------------------------- Track Dims -------------------------------
x1=10;x2=12;x3=13;x4=14;x5=16;x6=18;x7=20;x8=21;x9=22;x10=24;
y1=10;y2=12;y3=13;y4=15;y5=16;y6=19;y7=20;y8=22;y9=23;y10=26;y11=27;
y12=29;y13=30;y14=32;

% ---------------------------- Track Lines -----------------------------
xout = [x1 x1 x4 x4 x1 x1 x2 x9 x10 x10 x7 x7 x10 x10 x9 x2 x1];
yout = [y2 y5 y7 y8 y10 y13 y14 y14 y13 y10 y8 y7 y5 y2 y1 y1 y2];

xin = [x2 x2 x5 x5 x2 x2 x3 x8 x9 x9 x6 x6 x9 x9 x8 x3 x2];
yin = [y3 y4 y6 y9 y11 y12 y13 y13 y12 y11 y9 y6 y4 y3 y2 y2 y3];

% build outside track lines
for i = 1:16
    tx(i,:) = [xout(i) xout(i+1)];
    ty(i,:) = [yout(i) yout(i+1)];
end

% build outside track lines
for i = 17:32
    tx(i,:) = [xin(i-16) xin(i+1-16)];
    ty(i,:) = [yin(i-16) yin(i+1-16)];
end


% Plot track
th = zeros(32,1);
for it = 1:32
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end