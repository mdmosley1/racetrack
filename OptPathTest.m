%% Test OptPath.m
% function OptPath(muts,mutr,np,its)
clear; clc; close all; dbstop if error;
muts = 2; mutr = 20; np = 30; its = 50; smin = 2; smax = sqrt(5^2+1^2);
tstart = tic; % start timer

myTrack = track_data1;
[BestChrom] = OptPath(muts,mutr,np,its,smin,smax,myTrack,track_data);
toc(tstart)