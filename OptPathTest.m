%% Test OptPath.m
% function OptPath(muts,mutr,np,its)
clear; clc; close all; dbstop if error;
muts = 2; mutr = 20; np = 30; its = 50; smin = 2; smax = sqrt(5^2+1^2);
tstart = tic; % start timer

load track_data1.mat;
[BestChrom] = OptPath(muts,mutr,np,its,smin,smax);
toc(tstart)