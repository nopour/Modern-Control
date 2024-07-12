clc
close all

ccc=["#A2142F";"#0072BD";"#EDB120";"#77AC30"]; %code for colour 
ccc1=["#c1272d";"#0000a7";"#eecc16";"#008176";"b3b3b3"]; %code for colour 
c1=[0.83 0.14 0.14];%code for colour 
c2=[1.00 0.54 0.00];%code for colour 
c3=[0.47 0.25 0.80];%code for colour 
c4=[0.25 0.80 0.54];%code for colour 

figure
plot(out.X,out.Y,'color',c1,'LineWidth',1.5)
grid minor
grid on
xlabel('x')
ylabel('y')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot(out.X,out.Z,'color',c2,'LineWidth',1.5)
grid minor
grid on
xlabel('x')
ylabel('z')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 


figure
plot(out.Y,out.Z,'color',c3,'LineWidth',1.5)
grid minor
grid on
xlabel('y')
ylabel('z')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 

figure
plot3(out.X,out.Y,out.Z,'color',c4,'LineWidth',1.5)
grid minor
grid on
xlabel('x')
zlabel('z')
ylabel('y')
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
view(30,30)