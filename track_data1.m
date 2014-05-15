%% ---------------------------- Track Dims -------------------------------
e2 = 3; e1 = 2*e2; w = 4*e2; h = 8*e2; h2 = h-2*e2; w2 = w - 2*e2;
d = 10; % distance from axis
H = 2*e1+h+d; W =2*e1+w+d; % height and width of the whole grid
sx = e2+d; sy = e1+e2+h2/2+d; % start position

% use intermediary values for track data: h1,h2,h3...H for different
% y-values. w1,w2,w3...W for different x-values
x1 = d; x2 = d+e1; x3 = d+e1+e2; x4 = d+e1+e2+w2; x5 = d+e1+w; x6 = W;
y1 = d; y2 = d+e1; y3 = d+e1+e2; y4 = d+e1+h/2; y5 = d+e1+e2+h2;
y6 = d+e1+h; y7 = H;

%% ---------------------------- Track Lines -------------------------------

% Track Line Data
tx(1,:) = [x1 x1];
ty(1,:) = [y6 y2];

tx(2,:) = [x1 x2];
ty(2,:) = [y2 y1];

tx(3,:) = [x2 x5];
ty(3,:) = [y1 y1];

tx(4,:) = [x5 x6];
ty(4,:) = [y1 y2];

tx(5,:) = [x6 x6];
ty(5,:) = [y2 y6];

tx(6,:) = [x6 x5];
ty(6,:) = [y6 y7];

tx(7,:) = [x5 x2];
ty(7,:) = [y7 y7];

tx(8,:) = [x2 x1];
ty(8,:) = [y7 y6];

tx(9,:) = [x2 x2];
ty(9,:) = [y5 y3];

tx(10,:) = [x2 x3];
ty(10,:) = [y3 y2];

tx(11,:) = [x3 x4];
ty(11,:) = [y2 y2];

tx(12,:) = [x4 x5];
ty(12,:) = [y2 y3];

tx(13,:) = [x5 x5];
ty(13,:) = [y3 y5];

tx(14,:) = [x5 x4];
ty(14,:) = [y5 y6];

tx(15,:) = [x4 x3];
ty(15,:) = [y6 y6];

tx(16,:) = [x3 x2];
ty(16,:) = [y6 y5];

% Fitness checkpoint lines
chkx(1,:) = [x1 x2];
chky(1,:) = [y5 y5];

chkx(2,:) = [x3 x3];
chky(2,:) = [y6 y7];

chkx(3,:) = [x4 x4];
chky(3,:) = [y6 y7];

chkx(4,:) = [x5 x6];
chky(4,:) = [y5 y5];

chkx(5,:) = [x5 x6];
chky(5,:) = [y4 y4];

chkx(6,:) = [x5 x6];
chky(6,:) = [y3 y3];

chkx(7,:) = [x4 x4];
chky(7,:) = [y2 y1];

chkx(8,:) = [x3 x3];
chky(8,:) = [y2 y1];

chkx(9,:) = [x1 x2];
chky(9,:) = [y3 y3];

chkx(10,:) = [x1 x2];
chky(10,:) = [y4 y4];