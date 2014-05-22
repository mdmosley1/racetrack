function track_data = setTrackData1
%SETTRACKPATH1 Set the path for track1
%   Detailed explanation goes here

% Track parameters
% see figure for description of parameters
d = 10; % displacement from xy axis
e1 = 6; 
e2 = e1/2;
h1 = 4*e1;
w1 = 2*e1;
h2 = h1 - 2*e2;
w2 = w1 - 2*e2;

% Intermediate values to make setting track path easier

x(1) = d;
x(2) = x(1) + e1;
x(3) = x(2) + e2;
x(4) = x(3) + w2;
x(5) = x(2) + w1;
x(6) = x(5) + e1;

y(1) = d;
y(2) = y(1) + e1;
y(3) = y(2) + e2;
y(4) = y(2) + h1/2;
y(5) = y(3) + h2;
y(6) = y(2) + h1;
y(7) = y(6) + e1;

% Set the outside and inside track arrays
inside = [x(2) x(2) x(3) x(4) x(5) x(5) x(4) x(3) x(2)
          y(3) y(5) y(6) y(6) y(5) y(3) y(2) y(2) y(3)];
outside = [x(1) x(1) x(2) x(5) x(6) x(6) x(5) x(2) x(1)
           y(2) y(6) y(7) y(7) y(6) y(2) y(1) y(1) y(2)];
       
% Other important data (this is the only way I've found to do this)
start = [d+e2 y(4)];
H = max(y);
W = max(x);
cp{1} = [x(5) x(6); y(4) y(4)];
cp{2} = [x(1) x(2); y(4) y(4)];
% pack up data into cell array since only one property ouput can be
% returned
track_data = {inside outside start H W cp};
end

