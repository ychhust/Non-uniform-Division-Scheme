clc;
close all;
t=-8:0.01:8;
f0=0.004;
f1=0.03;
f2=0.07;
x1=150*sin(2*pi*f0*t)+150;
x2=70*sin(2*pi*f1*t)+10;
x3=15*sin(2*pi*f2*t)+15;
y=x1+x2+x3;
figure()
plot(t,y,'k','LineWidth',3)
% set(gca,'YLim',[-0.5 2]);
% xlabel('time domain (t)','FontSize',10,'LineWidth',3)
% title('The Discretization of x(t)','FontSize',12,'LineWidth',3)
% text(10,1.4,'x(nT)','FontSize',12)
xlabel('spatial domain (\xi)','FontSize',15,'FontWeight','bold')
title('The Continuous Signal x(\xi)','FontSize',18,'FontWeight','bold')
text(5.5,250,'x(\xi)','FontSize',18)
hold on;
% t1=-8:4:8;
t2=-8:4:-4;
t3=-4:2:4;
t4=4:4:8;
t1=[t2 t3 t4];
x1=150*sin(2*pi*f0*t1)+150;
x2=70*sin(2*pi*f1*t1)+10;
x3=15*sin(2*pi*f2*t1)+15;
y=x1+x2+x3;
stem(t1,y-2,'fill','r^','LineWidth',3);
xlim([-8 8])
% set(gca,'XTick',[-8 8])
set(gca,'FontSize',14,'FontWeight','bold')


% figure
% y=ones(1,length(t1));
% stem(t1,y,'fill','r^','LineWidth',1.5)
% xlabel('time domain (t)','FontSize',10,'LineWidth',3)
% title('The Impulse-train Sampling Signal p(t)','FontSize',12,'LineWidth',3)
% text(10,1.2,'p(t)','FontSize',15)
% set(gca,'XLim',[-21 21]);
% set(gca,'YLim',[0 1.75]);
% % 
% t2=-20:1.5:-15.5;
% t3=-8:2:-5;
% t4=-5:0.5:6;
% % t5=6:2:10;
% % t6=17:1.5:20;
% t=[t3 t4];
% x1=150*sin(2*pi*f0*t)+150;
% x2=70*sin(2*pi*f1*t)+10;
% x3=15*sin(2*pi*f2*t)+15;
% y=x1+x2+x3;
% stem(t,y-2,'fill','r^','LineWidth',1.5)
% xlabel('spatial domain (\xi)','FontSize',10,'LineWidth',3)
% title('The Non-uniform Sampling Method','FontSize',12,'LineWidth',3)
% % text(10,1.4,'x(\xi)','FontSize',15)
