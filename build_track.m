function [th,ch,clr] = build_track(xyout,xyin,np,H)
%PLOT_TRACK This function plots the track and checkpoints
%   Detailed explanation goes here

% build outside track lines
sz = size(xyout);l = sz(2);

for i = 1:l-1
    tx(i,:) = [xyout(1,i) xyout(1,i+1)];
    ty(i,:) = [xyout(2,i) xyout(2,i+1)];
end

% build inside track lines
for i = l:2*l-1
    tx(i,:) = [xyin(1,i-(l-1)) xyin(1,i+1-(l-1))];
    ty(i,:) = [xyin(2,i-(l-1)) xyin(2,i+1-(l-1))];
end

% Plot track
th = zeros(16,1);
for it = 1:16
    th(it) = line(tx(it,:),ty(it,:)); hold on;
end

% Plot checkpoints
ch = zeros(1,11);
for it = 1:10
    ch(it) = line(chkx(it,:),chky(it,:)); hold on;
    set(ch(it),'Color','g');
end

axis([0 H+10 0 H+10]);
grid on % adjust grid size
 
% color map
clr = lines(np);
end