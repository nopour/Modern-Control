clc
clear
close all

A=[2 0 0;0 2 0;0 3 1];
B=[1;0;0];
C=[1,1,1];

[Abar,Bbar,Cbar,T,k]=ctrbf(A,B,C)