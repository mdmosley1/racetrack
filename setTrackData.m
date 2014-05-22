function track_data = setTrackData
%SETTRACKPATH1 Set the path for track1
%   Detailed explanation goes here

% Track parameters
% see figure for description of parameters
d = 10; % displacement from xy axis
e1 = 6; 
e2 = e1/2;
h1 = 2*e1;
w1 = 5*e1;
h2 = h1 - 2*e2;
w2 = w1 - 2*e2;

% Intermediate values to make setting track path easier

x(1) = d;
x(2) = x(1) + e1;
x(3) = x(2) + e2;
x(4) = x(3) + e2;
x(5) = x(4) + e1;
x(6) = x(2) + w1 - 2*e1;
x(7) = x(6) + e1;
x(8) = x(3) + w2;
x(9) = x(2) + w1;
x(10) = x(9) + e1;

y(1) = d;
y(2) = y(1) + e1;
y(3) = y(2) + e2;
y(4) = y(3) + h2;
y(5) = y(2) + h1;
y(6) = y(5) + s;
y(7) = y(6) + e2;
y(8) = y(7) + h2;
y(9) = y(8) + e2;
y(10) = y(9) + s;
y(11) = y(10) + e2;
y(12) = y(11) + h2;
y(13) = y(10) + h1;
y(14) = y(13) + e1;

% Set the outside and inside track arrays
inside = [x(2) x(2) x(5) x(5) x(2) x(2) x(3) x(8) x(9)...
          x(9) x(6) x(6) x(9) x(9) x(8) x(3) x(2);
          y(3) y(4) y(6) y(9) y(11) y(12) y(13) y(13) y(12)...
          y(11) y(9) y(6) y(4) y(3) y(2) y(2) y(3)];
outside = [x(1) x(1) x(4) x(4) x(1) x(1) x(3) x(9) x(10)...
           x(10) x(7) x(7) x(10) x(10) x(9) x(2) x(1);
           y(2) y(5) y(7) y(8) y(10) y(13) y(14) y(14) y(13)...
           y(10) y(8) y(7) y(5) y(2) y(1) y(1) y(2)];
       
% Other important data (this is the only way I've found to do this)
start = [x(1)+e2 y(3)];
H = max(y);
W = max(x);
cp{1} = [x(9) x(10); y(3) y(3)];
cp{2} = [x(1) x(2); y(3) y(3)];
% pack up data into cell array since only one property ouput can be
% returned
track_data = {inside outside start H W cp};
end

