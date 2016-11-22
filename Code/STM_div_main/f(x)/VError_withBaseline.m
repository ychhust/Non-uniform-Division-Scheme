
delta_x=0:29;
delta_Vr_T=zeros(1,length(delta_x));
delta_Vi_T=zeros(1,length(delta_x));
delta_Vr_non_T=zeros(1,length(delta_x));
delta_Vi_non_T=zeros(1,length(delta_x));
V0_r=real(V0);%%%%%%%%%%%%%%%
V0_i=imag(V0);
for i=1:length(delta_x)
    visibility_T=[];
    visibility_non_T=[];
    delta_Vr=0;
    delta_Vi=0;
    delta_Vr_non=0;
    delta_Vi_non=0;
    for k=1:N
        [visibility_T,T_dist_extent_R,T_dist_extent_T]=E_visibility(visibility_T,extentpoint_place_start,extentpoint_place_end,Fov_0,div(k),extent_UV(ant_num+delta_x(i)));
        [visibility_non_T]=E_visibility_non(visibility_non_T,extentpoint_place_start,extentpoint_place_end,min_spacing,div(k),extent_UV(ant_num+delta_x(i)),Fov_0);
    end
    V0_r=ones(1,N)*real(V0(ant_num+delta_x(i)));%%%%%%%%%%%%%%%
    V0_i=ones(1,N)*imag(V0(ant_num+delta_x(i)));
%     delta_Vr_T(i)=sum(abs(V0_r-real(visibility_T)))/length(extent_UV);
%     delta_Vi_T(i)=sum(abs(V0_i-imag(visibility_T)))/length(extent_UV);
%     delta_Vr_non_T(i)=sum(abs(V0_r-real(visibility_non_T)))/length(extent_UV);
%     delta_Vi_non_T(i)=sum(abs(V0_i-imag(visibility_non_T)))/length(extent_UV);
    delta_V(i)=sum(sqrt((V0_r-real(visibility_T))^2+(V0_i-imag(visibility_T))^2))/length(extent_UV);
    delta_V_non(i)=sum(sqrt((V0_r-real(visibility_non_T))^2+(V0_i-imag(visibility_non_T))^2))/length(extent_UV);
end

% 结果分析五：可见度误差均值随基线的变化规律

figure()
plot(delta_x,log(delta_V),'-ob','LineWidth',3,'MarkerFaceColor','k')
hold on
plot(delta_x,log(delta_V_non),'-or','LineWidth',3,'MarkerFaceColor','c')
xlabel('The Length of Baselines（0.5\lambda）','FontSize',15,'FontWeight','bold')
ylabel('Visibility Degradation','FontSize',15,'FontWeight','bold')
ytick=get(gca,'yticklabel');
ytick=[repmat('10^(',size(ytick,1),1),ytick,repmat(')',size(ytick,1),1)];
set(gca,'yticklabel',ytick)
title('Regularity of Visibility Degradation','FontSize',18,'FontWeight','bold')
legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
set(gca,'FontSize',14,'FontWeight','bold')

% figure()
% plot(delta_x,log(delta_Vi_T),'-ob','LineWidth',3,'MarkerFaceColor','k')
% hold on
% plot(delta_x,log(delta_Vi_non_T),'-or','LineWidth',3,'MarkerFaceColor','c')
% xlabel('The Length of Baselines（0.5\lambda）','FontSize',15,'FontWeight','bold')
% ylabel('The Imag Component(log)','FontSize',15,'FontWeight','bold')
% title('The Imag Component of Visibility Degradation','FontSize',18,'FontWeight','bold')
% legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
% set(gca,'FontSize',14,'FontWeight','bold')
