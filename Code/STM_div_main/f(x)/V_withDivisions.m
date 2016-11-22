
delta_x=15;
V0_r=ones(1,N)*real(V0(ant_num+delta_x));%%%%%%%%%%%%%%%
V0_i=ones(1,N)*imag(V0(ant_num+delta_x));
for k=1:N
    [visibility_T,T_dist_extent_R,T_dist_extent_T]=E_visibility(visibility_T,extentpoint_place_start,extentpoint_place_end,Fov_0,div(k),extent_UV(ant_num+delta_x));
  
%     %% 对目标场景不均匀划分时可见度的求取
    [visibility_non_T]=E_visibility_non(visibility_non_T,extentpoint_place_start,extentpoint_place_end,min_spacing,div(k),extent_UV(ant_num+delta_x),Fov_0);
end

%     Vr_R=real(visibility_R);
%     Vi_R=imag(visibility_R);
Vr_T=real(visibility_T);
Vi_T=imag(visibility_T);

% %     Vr_non_R(i)=real(visibility_non_R);
% %     Vi_non_R(i)=imag(visibility_non_R);
Vr_non_T=real(visibility_non_T);
Vi_non_T=imag(visibility_non_T);
delta_V=sqrt((V0_r-real(visibility_T)).^2+(V0_i-imag(visibility_T)).^2);
delta_V_non=sqrt((V0_r-real(visibility_non_T)).^2+(V0_i-imag(visibility_non_T)).^2);

%%  结果分析二：可见度函数实部、虚部随均匀划分点数的变化规律
figure()
plot(div,V0_r,'r','LineWidth',4)
hold on
plot(div,Vr_T,'b','LineWidth',4)
hold on
plot(div,Vr_non_T,'g','LineWidth',4)
xlabel('Total Divisions','FontSize',16,'FontWeight','bold')
ylabel('Real Component of Visibility ','FontSize',16,'FontWeight','bold')
title('Real Component Change With Divisions','FontSize',19,'FontWeight','bold')
legend('Ideal Value','Uniform Division Scheme','Non-Uniform Division Scheme',0)
set(gca,'FontSize',15,'FontWeight','bold')
% 
% figure()
% plot(div,V0_i,'r','LineWidth',4)
% hold on
% plot(div,Vi_T,'b','LineWidth',4)
% hold on
% plot(div,Vi_non_T,'g','LineWidth',4)
% xlabel('The Total Divisions','FontSize',16,'FontWeight','bold')
% ylabel('The Imag Component of Visibility ','FontSize',16,'FontWeight','bold')
% title('The Imag Component Change With Divisions','FontSize',19,'FontWeight','bold')
% legend('The Ideal Value','Uniform Division Scheme','Non-Uniform Division Scheme',0)
% set(gca,'FontSize',15,'FontWeight','bold')
% % 
%%  结果分析三：可见度误差随划分点数的变化规律
figure()
plot(div,log(delta_V),'-ob','LineWidth',3,'MarkerFaceColor','k')
xlabel('Total Divisions','FontSize',16,'FontWeight','bold')
ylabel('Visibility Degradation ','FontSize',16,'FontWeight','bold')
hold on
plot(div,log(delta_V_non),'-or','LineWidth',3,'MarkerFaceColor','c')
ytick=get(gca,'yticklabel');
ytick=[repmat('10^(',size(ytick,1),1),ytick,repmat(')',size(ytick,1),1)];
set(gca,'yticklabel',ytick)
title('Regularity of Visibility Degradation','FontSize',19,'FontWeight','bold')
legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
set(gca,'FontSize',14,'FontWeight','bold')

% figure()
% plot(div,log(abs(V0_i-Vi_T)),'b','LineWidth',4)
% xlabel('The Total Divisions','FontSize',15,'FontWeight','bold')
% ylabel('The Imag Component(log)','FontSize',15,'FontWeight','bold')
% hold on
% plot(div,log(abs(V0_i-Vi_non_T)),'r','LineWidth',4)
% title('The Imag Component of Visibility Degradation','FontSize',18,'FontWeight','bold')
% legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
% set(gca,'FontSize',14,'FontWeight','bold')