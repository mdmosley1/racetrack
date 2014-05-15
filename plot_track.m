function [th,ch,clr] = plot_track(tx,ty,chkx,chky,np,H)
%PLOT_TRACK This function plots the track and checkpoints
%   Detailed explanation goes here

th = zeros(16);
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