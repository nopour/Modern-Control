clc

close all
%% Initial Parameters
k1=20;
k2=15;
m1 =2;
m2=1;
g=9.8;
l=0.5;
%% MATLAB CODE & PLOTS
Nonlinear=@(t,q) nonlinear2(q,k1,k2,m1,m2,l,g);
Linear=@(t,q) linear2(q,k1,k2,m1,m2,l,g);
time=linspace(0,10,500);
q0=[deg2rad(25) 0 0 0]';
[~,qNL]=ode45(Nonlinear,time,q0);
[~,qL]=ode45(Linear,time,q0);
ccc=["#A2142F";"#4DBEEE";"#0072BD";	"#EDB120"];
figure
plot(time,qNL(:,1),'color',ccc(3),'LineWidth' , 1.5); 
hold on
plot(time,qL(:,1),'--','color',ccc(4),'LineWidth' , 1.7); 
xlabel('Time, [s]','Interpreter','latex')
ylabel('$\theta$, [rad]','Interpreter','latex')
title('Variation of $\theta_1$, when $\theta_{10}$=25','Interpreter','latex')
legend('$\theta_1$-Nonlinear','$\theta_1$-Linear','Interpreter','latex','Location','best')
grid on
grid minor
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
%% SIMULINK CODE & PLOTS
figure
plot(out.time,out.qnonlinear(:,1),'color',ccc(3),'LineWidth' , 1.5); 
hold on
plot(out.time,out.qLinear(:,1),'--','color',ccc(4),'LineWidth' , 1.7); 
xlabel('Time, [s]','Interpreter','latex')
ylabel('$\theta$, [rad]','Interpreter','latex')
title('Variation of $\theta_1$, when $\theta_{10}$=25$^o$','Interpreter','latex')
legend('$\theta_1$-Nonlinear','$\theta_1$-Linear','Interpreter','latex','Location','best')
grid on
grid minor
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
figure
plot(out.time,out.qnonlinear(:,3),'color',ccc(3),'LineWidth' , 1.5); 
hold on
plot(out.time,out.qLinear(:,3),'--','color',ccc(4),'LineWidth' , 1.7); 
xlabel('Time, [s]','Interpreter','latex')
ylabel('$\theta$, [rad]','Interpreter','latex')
title('Variation of $\theta_2$, when $\theta_{10}$=25$^o$','Interpreter','latex')
legend('$\theta_2$-Nonlinear','$\theta_2$-Linear','Interpreter','latex','Location','best')
grid on
grid minor
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 