%% Test OptPath.m
% function OptPath(muts,mutr,np,its)
clear; clc; close all; dbstop if error;
muts = 5; mutr = 20; np = 30; its = 50; smin = 2; smax = sqrt(5^2+1^2);
tstart = tic; % start timer
% for a = 1:50
%     B(a) = OptPath(muts,mutr + a*2,np,its,smin,smax)
% end
OptPath(muts,mutr,np,its,smin,smax)
toc(tstart)