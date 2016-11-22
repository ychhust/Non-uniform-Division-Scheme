
delta_Vr_T=zeros(1,N);
delta_Vi_T=zeros(1,N);
delta_Vr_non_T=zeros(1,N);
delta_Vi_non_T=zeros(1,N);
for i=1:N
    visibility_T=[];
    visibility_non_T=[];
    delta_Vr=0;
    delta_Vi=0;
    delta_Vr_non=0;
    delta_Vi_non=0;
    for k=1:length(extent_UV)
        [visibility_T,T_dist_extent_R,T_dist_extent_T]=E_visibility(visibility_T,extentpoint_place_start,extentpoint_place_end,Fov_0,div(i),extent_UV(k));
        [visibility_non_T]=E_visibility_non(visibility_non_T,extentpoint_place_start,extentpoint_place_end,min_spacing,div(i),extent_UV(k),Fov_0);
    end
%     delta_Vr_T(i)=sum(abs(real(V0)-real(visibility_T)))/length(extent_UV);
%     delta_Vi_T(i)=sum(abs(imag(V0)-imag(visibility_T)))/length(extent_UV);
%     delta_Vr_non_T(i)=sum(abs(real(V0)-real(visibility_non_T)))/length(extent_UV);
%     delta_Vi_non_T(i)=sum(abs(imag(V0)-imag(visibility_non_T)))/length(extent_UV);
    delta_V(i)=sum(sqrt((real(V0)-real(visibility_T)).^2+(imag(V0)-imag(visibility_T)).^2))/length(extent_UV);
    delta_V_non(i)=sum(sqrt((real(V0)-real(visibility_non_T)).^2+(imag(V0)-imag(visibility_non_T)).^2))/length(extent_UV);
    
end


% 结果分析四：可见度误差均值随划分点数的变化关系
figure()
plot(div,log(delta_V),'-ob','LineWidth',3,'MarkerFaceColor','k')
hold on
plot(div,log(delta_V_non),'-or','LineWidth',3,'MarkerFaceColor','c')
xlabel('The Division Numbers','FontSize',15,'FontWeight','bold')
ylabel('Visibility Degradation','FontSize',15,'FontWeight','bold')
ytick=get(gca,'yticklabel');
ytick=[repmat('10^(',size(ytick,1),1),ytick,repmat(')',size(ytick,1),1)];
set(gca,'yticklabel',ytick)
title('Regularity of Visibility Degradation','FontSize',18,'FontWeight','bold')
legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
set(gca,'FontSize',14,'FontWeight','bold')

% figure()
% plot(div,log(delta_Vi_T),'-ob','LineWidth',3,'MarkerFaceColor','k')
% hold on
% plot(div,log(delta_Vi_non_T),'-or','LineWidth',3,'MarkerFaceColor','c')
% xlabel('The Division Numbers','FontSize',15,'FontWeight','bold')
% ylabel('The Imag Component(log)','FontSize',15,'FontWeight','bold')
% title('The Imag Component of Visibility Degradation','FontSize',18,'FontWeight','bold')
% legend('Uniform Division Scheme','Non-Uniform Division Scheme',0)
% set(gca,'FontSize',14,'FontWeight','bold')