%%%%%%%%%%% Advanced Automatic Control%%%%%%%%%%
%%%%%%%% Mechanical Engineering Department%%%%%%
%%%%%%% Amirkabir University of Technology%%%%%%
%%%%%%%%%%%%%%%%% 5 Nov. 23 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Reza Nopour 402126924 %%%%%%%%%%%%%%
clc
clear
close all
%%
num=[1 2];
den=[1 2 5 0];
%%
Gp = tf (num , den)
canon(Gp,'companion')
[A, B, C, D] = tf2ss(num, den);
[V, J] = jordan(A)
