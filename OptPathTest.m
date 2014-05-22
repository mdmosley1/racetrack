%% Test OptPath.m
% function OptPath(muts,mutr,np,its)
clear; clc; close all; dbstop if error;
muts = 5; mutr = 20; np = 30; its = 50; smin = 2; smax = sqrt(5^2+1^2);
tstart = tic; % start timer

myTrack = track1;
[BestChrom] = OptPath(muts,mutr,np,its,smin,smax,myTrack);
toc(tstart)