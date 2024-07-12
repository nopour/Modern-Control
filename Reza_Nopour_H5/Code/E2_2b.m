clc
clear
close all
%% Parameters
m=1;
k=10;
c=1;
%% 
A =[ 0 1 0 0 0 0;
-2*k/m -2*c/m k/m c/m 0 0;
0 0 0 1 0 0;
k/m c/m -2*k/m -2*c/m k/m c/m;
0 0 0 0 0 1;
0 0 k/m c/m -2*k/m -2*c/m];


Q=eye(6);
P=lyap(A',Q)
eig(P)