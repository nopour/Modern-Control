clc
clear
A=[-2 1 2;-1 -2 2;-2 0 2];
B=[0 0;0 1;1 0];
C=eye(3)
m1=[-4 -5 -6].';
A1=[A-m1(1)*eye(3) B];
A1=null(A1)
q1=real(A1(4:end,1))
v1=real(A1(1:3,1))
A2=[A-m1(2)*eye(3) B];
A2=null(A2)
q2=real(A2(4:end,2))
v2=real(A2(1:3,2))
A3=[A-m1(3)*eye(3) B];
A3=null(A3)
q3=real(A3(4:end,1))
v3=real(A3(1:3,1))

k1=-[q1 q2 q3]*[v1 v2 v3]^-1


k2=place(A,B,m1)

%% 2
A=[-2 1 2;-1 -2 2;-2 0 2];
B=[0 0;0 1;1 0];
m1=[-1+1i;-1-1i;-2].';
A1=[A-m1(1)*eye(3) B];
A1=null(A1)
q1=real(A1(4:end,1))
v1=real(A1(1:3,1))
A2=[A-m1(2)*eye(3) B];
A2=null(A2)
q2=imag(A1(4:end,1))
v2=imag(A1(1:3,1))
A3=[A-m1(3)*eye(3) B];
A3=null(A3)
q3=real(A3(4:end,2))
v3=real(A3(1:3,2))

k=-[q1 q2 q3]*inv([v1 v2 v3])

k3=place(A,B,m1)
%%
x0=[1 0 1].';
sys1=ss(A,B,C,[]);
sys2=ss(A-B*k2,B,C,[]);
sys3=ss(A-B*k3,B,C,[]);
[y1,t1,x1]=initial(sys1,x0,15);
[y2,t2,x2]=initial(sys2,x0,15);
[y3,t3,x3]=initial(sys3,x0,15);
%% CODE FOR COLORS
ccc=["#A2142F";"#0072BD";"#EDB120";"#77AC30"]; %code for colour 
ccc1=["#c1272d";"#0000a7";"#eecc16";"#008176";"b3b3b3"]; %code for colour 
c1=[0.83 0.14 0.14];
c2=[1.00 0.54 0.00];
c3=[0.47 0.25 0.80];
c4=[0.25 0.80 0.54];
figure
plot(t1,x1(:,2),'-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,x2(:,2),':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,x3(:,2),'-','color',ccc(4),'LineWidth' , 1.6);
hold on
legend('real','$a$','$b$','Interpreter','latex','Location','best') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('$x_2$','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x_2$','Interpreter','latex')
xlim([0 (t2(end))])
%%
figure
plot(t1,x1(:,3),'-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,x2(:,3),':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,x3(:,3),'-','color',ccc(4),'LineWidth' , 1.6);
hold on
legend('real','$a$','$b$','Interpreter','latex','Location','best') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('$x_3$','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x_3$','Interpreter','latex')
xlim([0 (t2(end))])
%%
figure
plot(t1,x1(:,1),'-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,x2(:,1),':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,x3(:,1),'-','color',ccc(4),'LineWidth' , 1.6);
hold on
legend('real','$a$','$b$','Interpreter','latex','Location','best') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('$x_1$','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x_1$','Interpreter','latex')
xlim([0 (t2(end))])
figure

plot(t2,-k2*y2.',':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,-k3*y3.','-','color',ccc(4),'LineWidth' , 1.6);
hold on
legend('$a$','$a$','$b$','$b$','Interpreter','latex','Location','best')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('Control Effort','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$-KY$','Interpreter','latex')
xlim([0 (t2(end))])