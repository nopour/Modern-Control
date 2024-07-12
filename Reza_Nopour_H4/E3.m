clc
clear
close all
syms l
A=[2 0 0;0 2 0;0 3 1];
[V D W]=eig(A)
B=[1;0;0];
C=[1,1,1];

Ob = obsv(A,C)
rank(Ob)
eq=det(l*eye(3)-A)==0;
l=solve(eq,l);
Q1=[l(1)*eye(3)-A B]
rank(Q1)
W(:,2).'*B

Q2=[l(2)*eye(3)-A B]
rank(Q2)
W(:,1).'*B

O1=[l(1)*eye(3)-A ;C]
rank(O1)

O2=[l(2)*eye(3)-A ;C]
rank(O2)

%% Part b
C=[1,1,1];
C=diag(C);
disp('***Part b.***')
O1=[l(1)*eye(3)-A ;C]
rank(O1)

O2=[l(2)*eye(3)-A ;C]
rank(O2)