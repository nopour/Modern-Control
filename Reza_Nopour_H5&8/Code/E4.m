clc
clear
close all
M = 1;
m = 0.1;
l = 1;
g = 9.8;
k = 1;
R = 100;
r = 0.02;
A = [0 1 0 0;...
0 -k^2/(M*r^2*R) -m*g/M 0;...
0 0 0 1;...
0 k^2/(M*r^2*R*l) (M+m)*g/(M*l) 0];
B = [0;k/(M*R*r);0;-k/(M*R*r*l)];
q1 = 100;
q3 = 3000;
Q = [q1 0 0 0;0 0 0 0;0 0 q3 0;0 0 0 0];
R = 0.001:0.1:50;
for i = 1:numel(R)
    K(i,:) = lqr(A,B,Q,R(i));
    Ac = A-B*K(i,:);
    landa(:,i) = real(eig(Ac));
end
figure(1)
subplot(2,2,1)
plot(R,K(:,1),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$K_{1}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,2)
plot(R,K(:,2),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$K_{2}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,3)
plot(R,K(:,3),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$K_{3}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,4)
plot(R,K(:,4),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$K_{4}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
figure(2)
subplot(2,2,1)
plot(R,landa(1,:),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$\lambda_{1}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,2)
plot(R,landa(2,:),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$\lambda_{2}$','Interpreter','latex')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,3)
plot(R,landa(3,:),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$\lambda_{3}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
subplot(2,2,4)
plot(R,landa(4,:),'linewidth',1.6)
grid on
grid minor
xlabel('$r^{2}$','Interpreter','latex') 
ylabel('$\lambda_{4}$','Interpreter','latex') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 