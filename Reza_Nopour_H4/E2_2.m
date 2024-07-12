clc
clear
close all

A=[-1 0 -2;0 -1 1;1 0 -1];
B=[0 1 0].';
C=[1 0 0];
Ob = obsv(A,C)
rank=rank(Ob)
null=null(Ob,'r')
[V D]=eig(A);
C*V(:,1)
C*V(:,2)
C*V(:,3)


% T=[V(:,2) V(:,3) V(:,1)];
% Tinv=inv(T);
% Abar=Tinv*A*T
% Bbar=T*B
% Cbar=C*Tinv
% Ob2 = obsv(Abar,Cbar)
% null(Ob2)