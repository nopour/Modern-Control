clc
clear
close all

A=[2 0 0;0 2 0; 0 3 1];
B=[0 1;1 0;0 1];
C=[1 0 0;0 1 0];

Co=ctrb(A,B)
rank(Co)
unco = length(A) - rank(Co)

Ob = obsv(A,C)
rank(Ob)
unob = length(A) - rank(Ob)

[V D]=eig(A);
D=diag([2 1 1]);
V=[1.0000                  0   0 
   0            0.3162     0  
   0        0.9487   1.0000   ];
Abar=inv(V)*A*V
Bbar=(V)*B
Cbar=C*inv(V)