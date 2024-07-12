clc
clear
close all
%% CODE FOR COLORS
ccc=["#A2142F";"#0072BD";"#EDB120";"#77AC30"]; %code for colour 
ccc1=["#c1272d";"#0000a7";"#eecc16";"#008176";"b3b3b3"]; %code for colour 
c1=[0.83 0.14 0.14];
c2=[1.00 0.54 0.00];
c3=[0.47 0.25 0.80];
c4=[0.25 0.80 0.54];
%% Parameters
m=1;
k=10;
c=-1;
%%
time=linspace(0,50,1000);
x0=ones(6,1);
[t, x] = ode45(@MSD3,time,x0);
figure
title('Phase Portraits','Interpreter','latex')
subplot(3,1,1)
plot(x(:,1),x(:,2),'--','color',ccc(1),'LineWidth' , 1.6);
title('First subsystem ($x_1$)','Interpreter','latex')
xlabel('$x_1$','Interpreter','latex')
ylabel('$\dot{x_1}$','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(3,1,2)
plot(x(:,3),x(:,4),'-','color',ccc(2),'LineWidth' , 1.6);
title('Second subsystem ($x_2$)','Interpreter','latex')
xlabel('$x_2$','Interpreter','latex')
ylabel('$\dot{x_2}$','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(3,1,3)
plot(x(:,5),x(:,6),'-.','color',ccc(3),'LineWidth' , 1.6);
title('Third subsystem ($x_3$)','Interpreter','latex')
xlabel('$x_3$','Interpreter','latex')
ylabel('$\dot{x_3}$','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
%%
figure
V_x = (k/2*(x(:,1).^2)) + (k/2*((x(:,1)-x(:,3)).^2)) + (k/2*((x(:,3)-x(:,5)).^2))+ (k/2*(x(:,5).^2)) + (m/2*(x(:,2).^2)) +(m/2*(x(:,4).^2)) + (m/2*(x(:,6).^2));
plot(t,V_x,'-','color',c1,'LineWidth' , 2);
title('Energy stored of the system','Interpreter','latex')
xlabel('$Time, [s]$','Interpreter','latex')
ylabel('$V(x)$','Interpreter','latex')
grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
%%
function x_dot = MSD3(t,x)
m=1;
k=10;
c=0;
x_dot=[ x(2);
(k*(x(3)-x(1))+c*(x(4)-x(2))-k*x(1)-c*x(2))/m;
x(4);
(k*(x(5)-x(3))+c*(x(6)-x(4))-k*(x(3)-x(1)))/m;
x(6);
(-k*x(5)-c*(x(6))-k*(x(5)-x(3))-c*(x(6)-x(4)))/m; ];
end