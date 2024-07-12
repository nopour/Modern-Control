clc
clear
close all;
%% Initial Parameters.
k1=20;
k2=15;
m1=2;
m2=1;
l=0.5;
g=9.8;

%% State Space

A=[0 1 0 0;
   (-k1/m1-g/l) 0 k1/m1 0;
   0 0 0 1;
   k1/m1 0 ((k1+k2)/m2+g/l) 0];
B1=[0 0;1 0;0 0;0 0];
B2=[0 0;0 0;0 0;0 1];
B3=[0 0;1 0;0 0;0 1]; 

q11=ctrb(A,B1);
q1=rank(q11)
unco1 = length(A) - rank(q11)

q22=ctrb(A,B2);
q2=rank(q22)
unco2 = length(A) - rank(q22)

q33=ctrb(A,B3);
q3=rank(q33)
unco3 = length(A) - rank(q33)

