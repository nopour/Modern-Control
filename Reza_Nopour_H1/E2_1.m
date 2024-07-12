clc
close all

ccc=["#A2142F";"#0072BD";"#EDB120";"#77AC30"]; %code for colour 
ccc1=["#c1272d";"#0000a7";"#eecc16";"#008176";"b3b3b3"]; %code for colour 
c1=[0.83 0.14 0.14];%code for colour 
c2=[1.00 0.54 0.00];%code for colour 
c3=[0.47 0.25 0.80];%code for colour 
c4=[0.25 0.80 0.54];%code for colour 

figure
plot(time,Step,'color',c1,'LineWidth',1.5)
grid minor
grid on
xlabel('Time, [s]','Interpreter','latex')
ylabel('Amplitude','Interpreter','latex')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot(time,x,'color',c2,'LineWidth',1.5)
grid minor
grid on
xlabel('Time, [s]','Interpreter','latex')
ylabel('$x$','Interpreter','latex')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot(time,theta,'color',c3,'LineWidth',1.5)
grid minor
grid on
xlabel('Time, [s]','Interpreter','latex')
ylabel('$\theta$ ','Interpreter','latex')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 