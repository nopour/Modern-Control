clc
clear
close all

Mm=75;
Jm=3.2;
Mr=2;
Jr=1.5;
L=1.8;
l=1;
g=9.81;

k=Jr*(Jm+Mm*L^2/4+Mr*l^2);

A=[0 1 0 0; Jr*g*(Mm*L/2+Mr*l)/k 0 0 0;0 0 0 1;-Jr*g*(Mm*L/2+Mr*l)/k 0 0 0];
B=[0;-Jr/k;0;(Jm+Jr+Mm*L^2/4+Mr*l^2)/k];
Co=ctrb(A,B)
rank(Co)
unco = length(A) - rank(Co)

C1=[0 0 1 0];
C2=[1 0 0 0];
C3=[1 0 0 0;0 0 1 0];
[V D]=eig(A);
Ob = obsv(A,C1)
rank(Ob)
unob = length(A) - rank(Ob)

Ob2 = obsv(A,C2)
rank(Ob2)
unob = length(A) - rank(Ob2)
C2*V(:,1)
C2*V(:,2)
C2*V(:,3)
C2*V(:,4)

Ob3 = obsv(A,C3)
rank(Ob3)
unob = length(A) - rank(Ob3)