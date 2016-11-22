%% 场景分布及划分方式示意图
figure()
x=-1:0.001:1;
for k=1:length(x)
    T(k)=Scene_power(extentpoint_place_start,extentpoint_place_end,x(k));
end
plot(x,T,'b','LineWidth',4)
hold on

div=20;
% x1=linspace(-1,1,div);
% for k=1:length(x1)
%     T1(k)=Scene_power(extentpoint_place_start,extentpoint_place_end,x1(k));
% end
% plot(x1,T1,'or','MarkerSize',2,'LineWidth',3)

x1=[];
c=linspace(-0.7,-0.4,div/20*3+1);
x1=[x1 c];
c=linspace(-0.4,-0.3,div/20*5+1);
x1=[x1 c];
c=linspace(-0.3,0.3,div/20*7+1);
x1=[x1 c];
c=linspace(0.3,0.4,div/20*5+1);
x1=[x1 c];
c=linspace(0.4,0.6,div/20*2+1);
x1=[x1 c];

for k=1:length(x1)
    T1(k)=Scene_power(extentpoint_place_start,extentpoint_place_end,x1(k));
end
stem(x1,T1,'filled','r--')
xlim([-0.7 0.6])
% plot(x1,T1,'or','MarkerSize',2,'LineWidth',3)
% hold on
% plot([-0.4 -0.4],[0 275],'--g')
% hold on
% plot([-0.3 -0.3],[0 275],'--g')
% hold on
% plot([0.2 0.2],[0 275],'--g')
% hold on
% plot([0.3 0.3],[0 275],'--g')

% xlabel('无混叠视场')
% ylabel('被积函数')
% title('无混叠视场内的被积函数')
xlabel('The Field of View','FontSize',13,'FontWeight','bold')
ylabel('The Brightness Temperature(K)','FontSize',13,'FontWeight','bold')
set(gca,'Ylim',[0 325])
% set(gca,'Xlim',[-0.5 0.5])
% title('The Distribution of Brightness Temperature in AF-FOV')
title('The Distribution of Brightness Temperature','FontSize',15,'FontWeight','bold')
set(gca,'FontSize',11,'FontWeight','bold')
% title('The Non-Uniform Division Scheme','FontSize',12,'LineWidth',2)

 %% 结果分析一：理想可见度分布

% figure()
% plot(Fov0,real(V0),'r','LineWidth',3)
% xlabel('AF-FOV','LineWidth',3)
% ylabel('Vr','LineWidth',3)
% title('The Ideal Value of The Real Component','LineWidth',3)
% 
% figure()
% plot(Fov0,imag(V0),'r','LineWidth',3)
% xlabel('AF-FOV','LineWidth',3)
% ylabel('Vi','LineWidth',3)
% title('The Ideal Value of The Imag Component','LineWidth',3)














