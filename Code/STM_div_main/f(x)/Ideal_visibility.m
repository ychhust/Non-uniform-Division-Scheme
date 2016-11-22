function V0=Ideal_visibility(extent_UV,place_start,place_end,Fov_0)
%   �﷨��
%   V0=Ideal_visibility(extent_UV,extentpoint_place_start,extentpoint_place_end,num,V0)��
% 
%   �������ܣ�
%   �˺���Ϊ�ɼ��Ⱥ������ۼ���ģ�飬����Ϊ��
%   ��ȡ�������зֲ���Ϣ�Լ������ֲ���Ϣ��ͨ�����ֹ�ʽ����ɼ��Ⱥ�������ֵ��

V0=[];

%% �������Ա仯
%%��������ΪĿ�곡����������

%%��С���߼��ͳ�ƹ���
% min_spacing=0.5:0.02:1;
% for k=1:length(min_spacing)
%     extent_UV=-29:29;
%     extent_UV = extent_UV*min_spacing(k);
%     
for k=1:length(extent_UV)
    for m=1:length(place_start)
        x(m)=place_start(m);%���������ȷ��
        y(m)=place_end(m);
        if(x(m)==-0.7)
             F=@(x)(100+1.5*sin(10*pi*(x+0.4))).*exp(j*2*pi*x*extent_UV(k)); 
        else if(x(m)==-0.4)
            %             F=@(x)(50+(x+0.4)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
            F=@(x)(100+(200+(x+0.3).^2*(-20000))).*exp(j*2*pi*x*extent_UV(k));%���ֹ�ʽ
            
        else if(x(m)==-0.3)
                F=@(x)(300+2*sin(10*pi*(x+0.3))).*exp(j*2*pi*x*extent_UV(k));%���ֹ�ʽ
                % F=@(x)(250)./sqrt(1-x.^2).*exp(j*2*pi*x*extent_UV(k));%���ֹ�ʽ
            else if(x(m)==0.3)
                    F=@(x)(300+(x-0.3)*(-2000)).*exp(j*2*pi*x*extent_UV(k));%���ֹ�ʽ
                else
                    F=@(x)(100+1.5*sin(10*pi*(x-0.4))).*exp(j*2*pi*x*extent_UV(k));
                end
            end
        end
        end
        %         F=awgn(F,15,'measured');
        v(m)=quadl(@(x)F(x),x(m),y(m));%ͨ�����ֹ�ʽ�������ɼ��Ⱥ���
    end
    %     F1=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
    %     v1=quadl(@(x)F1(x),-0.5,place_start(1));
    %     v2=quadl(@(x)F1(x),place_start(length(place_start)),0.5);
    V=sum(v);
    V0=[V0 V];
end

%%��������Ϊ�����޻���ӳ�����
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(50+(x+0.4)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(250-(x-0.2)*2000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% ��������͹����͹�仯
%%%��������ΪĿ�곡����������
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%���������ȷ��
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
% %             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%                 
%             else
%                 F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%ͨ�����ֹ�ʽ�������ɼ��Ⱥ���
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%��������Ϊ�����޻���ӳ�����
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% ������͹�����仯
%%%��������ΪĿ�곡����������
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%���������ȷ��
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
%             F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%                 
%             else
%                 F=@(x)(250-(x-0.2).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%ͨ�����ֹ�ʽ�������ɼ��Ⱥ���
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%��������Ϊ�����޻���ӳ�����
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(250-(x+0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(250-(x-0.2).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end
%% ������͹�����仯
%%%��������ΪĿ�곡����������
% for k=1:length(extent_UV)
%     for m=1:length(place_start)
%         x(m)=place_start(m);%���������ȷ��
%         y(m)=place_end(m);
%         if(x(m)<-0.3)
%             F=@(x)(50+(x+0.4).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%         else if(x(m)<0.2&&x(m)>=-0.3)
%                 F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%                 
%             else
%                 F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%             end
%         end
%         v(m)=quadl(@(x)F(x),x(m),y(m));%ͨ�����ֹ�ʽ�������ɼ��Ⱥ���
%     end
%     V=sum(v);
%     V0=[V0 V];
% end

%%%��������Ϊ�����޻���ӳ�����
% for k=1:length(extent_UV)
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(1)=quadl(@(x)F(x),-Fov_0,place_start(1));
%     F=@(x)(50+(x+0.4).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(2)=quadl(@(x)F(x),place_start(1),place_end(1));
%     F=@(x)250./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(3)=quadl(@(x)F(x),place_start(2),place_end(2));
%     F=@(x)(50+(x-0.3).^2*20000)./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));
%     v(4)=quadl(@(x)F(x),place_start(3),place_end(3));
%     F=@(x)50./sqrt(1-x.^2).*cos(2*pi*x*extent_UV(k));%���ֹ�ʽ
%     v(5)=quadl(@(x)F(x),place_end(3),Fov_0);
% 
%     V=sum(v);
%     V0=[V0 V];
%     
% end

