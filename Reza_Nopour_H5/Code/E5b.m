clc
clear
close all
w=2;
ze=0.5;
A=[0 1;-w^2 -2*ze*w];
B=[0;1];
C=eye(2);
qq=[0.1,1,10,100];
rr=[0.1,1,10,100];

for i=1:numel(qq)
    q=1;
    Q=diag([q,q]);
    R=rr(i);
    [K(i,:),S,e] = lqr(A,B,Q,R);
    AC{i} = A-B*K(i,:);
end
x0=[1 1];
sys=ss(A,B,C,[]);
sys1=ss(AC{1},B,C,[]);
sys2=ss(AC{2},B,C,[]);
sys3=ss(AC{3},B,C,[]);
sys4=ss(AC{4},B,C,[]);
[y,t,x]=initial(sys,x0);
[y1,t1,x1]=initial(sys1,x0);
[y2,t2,x2]=initial(sys2,x0);
[y3,t3,x3]=initial(sys3,x0);
[y4,t4,x4]=initial(sys4,x0);
%% Plot Area
%% CODE FOR COLORS
ccc=["#A2142F";"#0072BD";"#EDB120";"#77AC30"]; %code for colour 
ccc1=["#c1272d";"#0000a7";"#eecc16";"#008176";"b3b3b3"]; %code for colour 
c1=[0.83 0.14 0.14];
c2=[1.00 0.54 0.00];
c3=[0.47 0.25 0.80];
c4=[0.25 0.80 0.54];
figure
plot(t,x(:,2),'--','color',ccc(1),'LineWidth' , 1.6);
hold on
plot(t1,x1(:,2),'-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,x2(:,2),':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,x3(:,2),'-','color',ccc(4),'LineWidth' , 1.6);
hold on
plot(t4,x4(:,2),'--','color',c1,'LineWidth' , 1.6);
legend('real','$r=0.1$','$r=1$','$r=10$','$r=100$','Interpreter','latex','Location','best') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('$x_2$','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x_2$','Interpreter','latex')
xlim([0 (t2(end))])
figure
plot(t,x(:,1),'--','color',ccc(1),'LineWidth' , 1.6);
hold on
plot(t1,x1(:,1),'-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,x2(:,1),':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,x3(:,1),'-','color',ccc(4),'LineWidth' , 1.6);
hold on
plot(t4,x4(:,1),'--','color',c1,'LineWidth' , 1.6);
legend('real','$r=0.1$','$r=1$','$r=10$','$r=100$','Interpreter','latex','Location','best') 
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('$x_1$','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x_1$','Interpreter','latex')
xlim([0 (t2(end))])
figure
plot(t1,-K(1,:)*y1.','-.','color',ccc(2),'LineWidth' , 1.6);
hold on
plot(t2,-K(2,:)*y2.',':.','color',ccc(3),'LineWidth' , 1.6);
hold on
plot(t3,-K(3,:)*y3.','-','color',ccc(4),'LineWidth' , 1.6);
hold on
plot(t4,-K(4,:)*y4.','--','color',c1,'LineWidth' , 1.6);
legend('$r=0.1$','$r=1$','$r=10$','$r=100$','Interpreter','latex','Location','best')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
grid on
grid minor
title('Control Effort','Interpreter','latex')
xlabel('Time, [s]','Interpreter','latex')
ylabel('$-KY$','Interpreter','latex')
xlim([0 (t2(end))])