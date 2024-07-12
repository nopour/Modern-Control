clc
clear
close all

syms s

p_f=[-5-2i -5+2i -10 -15 -20];
pf=poly(p_f);
pf(1)=[];
p_s=[-0.1 -1-0.5i -1+0.5i -2 -5];
ps=poly(p_s);
ps(1)=[];

A=[0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1;0 -4 -4 3 2];
B=[0;0;0;0;1];
C=[-2 -2.2 -0.2 0 0];
D=[0];
[b,aa]=ss2tf(A,B,C,D);

Co=ctrb(A,B)
fprintf('the rank of controllability matrix is %d. \n',rank(Co))

if rank(Co)==length(Co)
    disp('The matrix is full rank and the system is controllable!')
else
    disp('The matrix is not full rank and the system is uncontrollable!')
end

Ob=obsv(A,C)
fprintf('The rank of observability matrix is %d. \n',rank(Ob))
if rank(Ob)==length(Ob)
    disp('The matrix is full rank and the system is Observable!')
else
    disp('The matrix is not full rank and the system is not observable!')
end
%% Unobservable mode
[Abar,Bbar,Cbar,T,K]=obsvf(A,B,C)

%%


det(s*eye(length(A))-A);
a=[-2 -3 4 4 0];
Psi=[1 a(1) a(2) a(3) a(4)
     0 1 a(1) a(2) a(3)
     0 0 1 a(1) a(2)
     0 0 0 1 a(1)
     0 0 0 0 1 ];
%% Fast
k_bass_fast=(pf-a)*inv(Co*Psi)

k_acker_fast=acker(A,B,p_f)

k_acker_fast2=[0 0 0 0 1]*inv(Co)*(pf(5)*eye(5)+pf(4)*A+pf(3)*A^2+pf(2)*A^3+pf(1)*A^4+A^5)
%% Slow
k_bass_slow=(ps-a)*inv(Co*Psi)

k_acker_slow=acker(A,B,p_s)
k_acker_slow2=[0 0 0 0 1]*inv(Co)*(ps(5)*eye(5)+ps(4)*A+ps(3)*A^2+ps(2)*A^3+ps(1)*A^4+A^5)


%% Problem 5

A=[0 1; 0 -10]; 
B=[0;1];
C=[1 0];
Poles=roots([1 12.8 64]).';
k=place(A,B,Poles)

%%
tspan=linspace(0,5,100);
x0=[0;0;0;0;1];
[t,xs]=ode45(@systems,tspan,x0);
[t,xf]=ode45(@systemf,tspan,x0);
uf=-k_acker_fast.*xf;
us=-k_acker_slow.*xs;

figure
plot(t,us(:,5),'LineWidth' , 1.6);
title('Control Effort (Slow)','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
figure
plot(t,uf(:,5),'LineWidth' , 1.6);
title('Control Effort (Fast)','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot(t,xs(:,1),'LineWidth' , 1.6);
hold on
plot(t,xs(:,2),'LineWidth' , 1.6);
hold on
plot(t,xs(:,3),'LineWidth' , 1.6);
hold on
plot(t,xs(:,4),'LineWidth' , 1.6);
hold on
plot(t,xs(:,5),'LineWidth' , 1.6);
hold on
legend('$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','Interpreter','latex')
title('Slow Response','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot(t,xf(:,1),'LineWidth' , 1.6);
hold on
plot(t,xf(:,2),'LineWidth' , 1.6);
hold on
plot(t,xf(:,3),'LineWidth' , 1.6);
hold on
plot(t,xf(:,4),'LineWidth' , 1.6);
hold on
plot(t,xf(:,5),'LineWidth' , 1.6);
hold on
legend
title('Fast Response','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
legend('$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','Interpreter','latex')

%%
function xp=systems(t,x)
A=[0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1;0 -4 -4 3 2];
B=[0;0;0;0;1];
k=[1.2500   11.3750   27.2750   29.1500   11.1000];
u=-k*x;
xp=A*x+B*u;
end

function xp=systemf(t,x)
A=[0 1 0 0 0;0 0 1 0 0;0 0 0 1 0;0 0 0 0 1;0 -4 -4 3 2];
B=[0;0;0;0;1];
k=[87000       48846       10801        1132          57];
u=-k*x;
xp=A*x+B*u;
end