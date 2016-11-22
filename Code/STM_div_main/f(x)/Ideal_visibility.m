function V0=Ideal_visibility(extent_UV,place_start,place_end,Fov_0)
%   语法：
%   V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,num,V0)；
% 
%   函数功能：
%   此函数为可见度函数理论计算模块，功能为：
%   读取天线阵列分布信息以及场景分布信息，通过积分公式输出可见度函数理论值。

V0=[];

%% 亮温线性变化
%%积分区间为目标场景所在区域

%%最小天线间距统计规律
% min_spacing=0.5:0.02:1;
% for k=1:length(min_spacing)
%     extent_UV=-29:29;
%     extent_UV = extent_UV*min_spacing(k);
%     
for k=1:length(extent_UV)
    for m=1:length(place_start)
        x(m)=place_start(m);%积分区间的确定
        y(m)=place_end(m);
        if(x(m)==-0.7)
             F=@(x)(100+1.5*sin(10*pi*(x+0.4))).*exp(j*2*pi*x*extent_UV(k)); 
        else if(x(m)==-0.4)
            %             F=@(x)(50+(x+0.4)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
            F=@(x)(100+(200+(x+0.3).^2*(-20000))).*exp(j*2*pi*x*extent_UV(k));%积分公式
            
        else if(x(m)==-0.3)
                F=@(x)(300+2*sin(10*pi*(x+0.3))).*exp(j*2*pi*x*extent_UV(k));%积分公式
                % F=@(x)(250)./sqrt(1-x.^2).*exp(j*2*pi*x*extent_UV(k));%积分公式
            else if(x(m)==0.3)
                    F=@(x)(300+(x-0.3)*(-2000)).*exp(j*2*pi*x*extent_UV(k));%积分公式
                else
                    F=@(x)(100+1.5*sin(10*pi*(x-0.4))).*exp(j*2*pi*x*extent_UV(k));
                end
            end
        end
        end
        %         F=awgn(F,15,'measured');
        v(m)=quadl(@(x)F(x),x(m),y(m));%通过积分公式求解理想可见度函数
    end
    %     F1=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
    %     v1=quadl(@(x)F1(x),-0.5,place_start(1));
    %     v2=quadl(@(x)F1(x),place_start(length(place_start)),0.5);
    V=sum(v);
    V0=[V0 V];
end

%%积分区间为整个无混叠视场区域
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(50+(x+0.4)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(250-(x-0.2)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% 亮温左上凸右下凸变化
%%%积分区间为目标场景所在区域
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%积分区间的确定
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
% %             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%                 
%             else
%                 F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%通过积分公式求解理想可见度函数
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%积分区间为整个无混叠视场区域
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% 亮温上凸函数变化
%%%积分区间为目标场景所在区域
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%积分区间的确定
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
%             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%                 
%             else
%                 F=@(x)(250-(x-0.2).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%通过积分公式求解理想可见度函数
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%积分区间为整个无混叠视场区域
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(250-(x-0.2).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% 亮温下凸函数变化
%%%积分区间为目标场景所在区域
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%积分区间的确定
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
%             F=@(x)(50+(x+0.4).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%                 
%             else
%                 F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%通过积分公式求解理想可见度函数
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%积分区间为整个无混叠视场区域
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(50+(x+0.4).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%积分公式
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end

