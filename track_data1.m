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

xyout = [x1 x1 x2 x5 x6 x6 x5 x2 x1;
         y2 y6 y7 y7 y6 y2 y1 y1 y2];

xyin = [x2 x2 x3 x4 x5 x5 x4 x3 x2;
       y3 y5 y6 y6 y5 y3 y2 y2 y3];




% % Fitness checkpoint lines
% chkx(1,:) = [x1 x2];
% chky(1,:) = [y5 y5];
% 
% chkx(2,:) = [x3 x3];
% chky(2,:) = [y6 y7];
% 
% chkx(3,:) = [x4 x4];
% chky(3,:) = [y6 y7];
% 
% chkx(4,:) = [x5 x6];
% chky(4,:) = [y5 y5];
% 
% chkx(5,:) = [x5 x6];
% chky(5,:) = [y4 y4];
% 
% chkx(6,:) = [x5 x6];
% chky(6,:) = [y3 y3];
% 
% chkx(7,:) = [x4 x4];
% chky(7,:) = [y2 y1];
% 
% chkx(8,:) = [x3 x3];
% chky(8,:) = [y2 y1];
% 
% chkx(9,:) = [x1 x2];
% chky(9,:) = [y3 y3];
% 
% chkx(10,:) = [x1 x2];
% chky(10,:) = [y4 y4];