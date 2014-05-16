function [th,ch,clr] = build_track(np,myTrack)
%PLOT_TRACK This function plots the track and checkpoints
%   Detailed explanation goes here

xyout = myTrack.outside;
xyin = myTrack.inside;

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
 ch = zeros(1,11);
% for it = 1:10
%     ch(it) = line(chkx(it,:),chky(it,:)); hold on;
%     set(ch(it),'Color','g');
% end
% 
% axis([0 H+10 0 H+10]);
grid on % adjust grid size
 
% color map
clr = lines(np);
end