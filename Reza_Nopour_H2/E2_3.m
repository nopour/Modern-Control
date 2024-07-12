%%%%%%%%%%% Advanced Automatic Control%%%%%%%%%%
%%%%%%%% Mechanical Engineering Department%%%%%%
%%%%%%% Amirkabir University of Technology%%%%%%
%%%%%%%%%%%%%%%%% 5 Nov. 23 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Reza Nopour 402126924 %%%%%%%%%%%%%%
clc
clear
close all
%% open-loop single-input, single-output 
%fourth–order linear time-invariant state
A=[0,1,0,0;0,0,1,0;0,0,0,1;-962,-126,-67,-4];
B=[0;0;0;1];
C=[300,0,0,0];
D=[0];
%% Part 3.(a)
[b,a] = ss2tf(A,B,C,D);
H = tf (b , a) %associated open-loop transfer function H (s)
sys = zpk(H) %covert it to zero-pole description
[z,p,k] = zpkdata(H)
[num,den,ts] = tfdata(H)
%% Part 3.(b)
cpc=poly(A) % characteristic polynomial coefficients
rcp=roots(a) %roots of the characteristic polynomial
%% Part 3.(c)
t = 0:0.01:10;
im = impulse(sys,t);
plot(t,im,'color',[0.25 0.80 0.54],'LineWidth',1.5)
ylabel('Amplitude','Interpreter','latex')
xlabel('Time, (seconds)','Interpreter','latex')
title('Impluse Response','Interpreter','latex')
set(gca,'FontSize',13)
set(gca,'fontname','Times New Roman') 
grid minor
grid on
%% Part 3.(d)
t = 0:0.01:10;
st = step(sys,t);
plot(t,st,'color',[0.47 0.25 0.80],'LineWidth',1.5)
ylabel('Amplitude','Interpreter','latex')
xlabel('Time, (seconds)','Interpreter','latex')
title('Step Response','Interpreter','latex')
set(gca,'FontSize',13)
set(gca,'fontname','Times New Roman') 
grid minor
grid on
%% Part 3.(e)
x0 = [1, 2, 3, 4].';
[u,tt] = gensig("square",10,40,0.01);
[y,t,x]=lsim(sys,u,tt,x0);
plot(t,y,'color',[1.00 0.54 0.00],'LineWidth',1.5);
hold on
plot(tt,u,'color',"k",'LineWidth',1);
ylabel('Amplitude','Interpreter','latex')
xlabel('Time, (seconds)','Interpreter','latex')
title('Linear Simulation Results','Interpreter','latex')
set(gca,'FontSize',13)
set(gca,'fontname','Times New Roman') 
grid minor
grid on
ylim([-1 2])
%% Part 3.(f)
[Tdcf,E] = eig(A)

%% Part 3.(g)
[A1, B1, C1, D1] = ss2ss(A, B, C, D, Tdcf)
%% Part 3.(h)
canon(sys,'modal')