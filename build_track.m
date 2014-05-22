function [th,ch,clr] = build_track(np,myTrack)
%PLOT_TRACK This function plots the track and checkpoints
%   Detailed explanation goes here

% Unpack data from myTrack.track_data
xyin = myTrack.track_data{1};
xyout = myTrack.track_data{2};
H = myTrack.track_data{4};
W = myTrack.track_data{5};

sz = size(xyout);sz = sz(2)-1;

% build outside track lines
for i = 1:sz
    tx(i,:) = [xyout(1,i) xyout(1,i+1)];
    ty(i,:) = [xyout(2,i) xyout(2,i+1)];
end

% build inside track lines
for i = 1:sz
    tx(i+sz,:) = [xyin(1,i) xyin(1,i+1)];
    ty(i+sz,:) = [xyin(2,i) xyin(2,i+1)];
end

% Plot track
th = zeros(sz*2,1);
for it = 1:sz*2
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end

% % Plot checkpoints
ch = zeros(1,5);
s = size(myTrack.cp); s = s(2);
for i = 1:s
    ch(i) = line( myTrack.cp{i}(1,:),myTrack.cp{i}(2,:) ); hold on;
    set(ch(i),'Color','g');
end

axis([0 H+10 0 H+10]);
grid on % adjust grid size
 
% color map
clr = lines(np);
end