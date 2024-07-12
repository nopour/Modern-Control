clc
clear 
close all
%%
syms t v1 v2
A=[0,-10;1,-1];
[q,d]=eig(A); %eig function
disp(q) %eigenvectors
disp(d) %eigenvalues
%%
eAt=vpa((expm(A*t)),4);


