


%% 第一部分：可见度误差随基线长度的变化关系

% figure()
% plot(delta_x,log(abs(real(V0(ant_num+delta_x))-Vr(delta_x))),'-ob','LineWidth',2,'MarkerFaceColor','k')
% hold on
% plot(delta_x,log(abs(real(V0(ant_num+delta_x))-Vr_non(delta_x))),'-or','LineWidth',2,'MarkerFaceColor','c')
% xlabel('The Length of Baselines(\lambda)','FontSize',10,'LineWidth',2)
% ylabel('The Real Component of Visibility Degradation(log)','FontSize',10,'LineWidth',2)
% title('The Real Component of Visibility Degradation','FontSize',10,'LineWidth',2)
% legend('Uniform Division Scheme','Non-Uniform Division Scheme','LineWidth',2,0)
% 
% 
% figure()
% plot(delta_x,log(abs(imag(V0(ant_num+delta_x))-Vi(delta_x))),'-ob','LineWidth',2,'MarkerFaceColor','k')
% hold on
% plot(delta_x,log(abs(imag(V0(ant_num+delta_x))-Vi_non(delta_x))),'-or','LineWidth',2,'MarkerFaceColor','c')
% xlabel('The Length of Baselines（\lambda）','FontSize',10,'LineWidth',2)
% ylabel('The Imaginary Component of Visibility Degradation(log)','FontSize',10,'LineWidth',2)
% title('The Imaginary Component of Visibility Degradation','FontSize',10,'LineWidth',2)
% legend('Uniform Division Scheme','Non-Uniform Division Scheme','LineWidth',2,0)

%% 第二部分：可见度误差随最小天线间距的变化关系

% figure()
% plot(min_spacing,log(abs(real(V0)-Vr)),'-ob','LineWidth',2,'MarkerFaceColor','k')
% hold on
% plot(min_spacing,log(abs(real(V0)-Vr_non)),'-or','LineWidth',2,'MarkerFaceColor','c')
% xla=['The Minimum Antenna Separation（',num2str(min_spacing),'\lambda）'];
% xlabel(xla,'FontSize',10,'LineWidth',2)
% ylabel('The Real Component of Visibility Degradation(log)','FontSize',10,'LineWidth',2)
% title('The Real Component of Visibility Degradation','FontSize',10,'LineWidth',2)
% legend('Uniform Division Scheme','Non-Uniform Division Scheme','LineWidth',2,0)
% 
% figure()
% plot(min_spacing,log(abs(imag(V0)-Vi)),'-ob','LineWidth',2,'MarkerFaceColor','k')
% hold on
% plot(min_spacing,log(abs(imag(V0)-Vi_non)),'-or','LineWidth',2,'MarkerFaceColor','c')
% xlabel(xla,'FontSize',10,'LineWidth',2)
% ylabel('The Imaginary Component of Visibility Degradation(log)','FontSize',10,'LineWidth',2)
% title('The Imaginary Component of Visibility Degradation','FontSize',10,'LineWidth',2)
% legend('Uniform Division Scheme','Non-Uniform Division Scheme','LineWidth',2,0)


