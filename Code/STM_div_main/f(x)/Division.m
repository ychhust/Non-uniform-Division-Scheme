function Fov=Division(Fov,start_point,end_point,div)
%   �﷨��
%   Fov=Division(Fov,x_scope,div,start_point,end_point,offset)
%   Fov=Division(Fov,start_point,end_point,div)
% 
%   �������ܣ�
%   �˺���ΪĿ�곡�����Ȼ���ģ�飬����Ϊ��
%   ��ȡĿ�곡���ֲ���Ϣ�����Ŀ�곡�����Ȳ�����λ�÷ֲ���Ϣ��


%% ����һ����sin(2*pi*k*l)���о��Ȼ���

%     n=find(x_scope>start_point&x_scope<=end_point);
%     if(~isempty(n))
%         x=x_scope(1,n);
%         y=sin(2*pi*(x+offset));
%         y= linspace(min(y),max(y),div);%��sin(2*pi*k*l)���о��Ȼ���
%         c=1/(2*pi).*asin(y);%sin(2*pi*k*l)���Ȼ�������Ӧ��lֵΪ�����ȷֲ�
%         c=c-offset;
%         Fov=[Fov c];
%     end
%     
%% ����������sin(2*pi*k*l)��l���в����Ȼ���
     c= linspace(start_point,end_point,div+1);
     Fov=[Fov c];
    