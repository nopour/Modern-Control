%%%%%%%%%%% Advanced Automatic Control%%%%%%%%%%
%%%%%%%% Mechanical Engineering Department%%%%%%
%%%%%%% Amirkabir University of Technology%%%%%%
%%%%%%%%%%%%%%%%% 5 Nov. 23 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Reza Nopour 402126924 %%%%%%%%%%%%%%
clc
clear
close all
%% 
syms s
%% Initial
m=0.1;
M=2;
l=1;
g=9.8;
k=1;
R=100;
r=0.02;

%% State Space
A=[0,1,0,0;0,-k^2/M/R/r^2,-m*g/M,0;0,0,0,1;0,k^2/M/l/R/r^2,(M+m)*g/M/l,0];
B=[0;k/M/R/r;0;-k/M/l/R/r];
C=[1,0,0,0;0,0,1,0];
D=[0;0];
%% SS2TF using definition
H=C*(s*eye(4)-A)^-1*B+D;
H=simplify(H);
pretty(H(1))
pretty(H(2)) 
%% SS2TF using functions
[b,a] = ss2tf(A,B,C,D,1)
Gp1 = tf (b(1,:) , a)
canon1=canon(Gp1,'modal')
Gp2 = tf (b(2,:), a)
canon2=canon(Gp2,'modal')