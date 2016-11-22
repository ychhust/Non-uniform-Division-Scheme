clear all;
close all;
figure()
x=0:29;
y=ones(1,30)*0;
plot(x,y,'or','MarkerSize',2,'LineWidth',3)
for i=1:2:30
    text(x(i)-0.15,y(i)+0.05,num2str(i),'Color','b','FontWeight','bold');
end
xlabel('X(0.5\lambda)','FontSize',12,'LineWidth',2);
ylabel('Y(0.5\lambda)','FontSize',12,'LineWidth',2);
title('The Array Structure','FontSize',12,'LineWidth',2)


figure()
x=-27:3:28;
y=ones(1,length(x))*0;
plot(x,y,'ob','MarkerSize',6,'LineWidth',2.5)
for i=1:length(x)
    text(x(i)-0.5,y(i)+0.08,num2str(x(i)),'Color','r','FontWeight','bold');
end
xlabel('X(0.5\lambda)','FontSize',12,'LineWidth',2);
ylabel('Y(0.5\lambda)','FontSize',12,'LineWidth',2);
title('The UV Plane','FontSize',12,'LineWidth',2)