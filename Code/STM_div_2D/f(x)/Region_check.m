function In=Region_check(x,y,B1)
%   �﷨��
%   in1=Region_check(x,y,M1)
% 
%   �������ܣ�
%   �˺���Ϊ���¹���������ȡģ�飬����Ϊ��
%   ��ȡ���������ꡢ��������߽���Ϣ������������Ƿ��������¹���������Ϣ��


%     in=inpolygon( y,x,M1(:,2),M1(:,1));%������������in=1
%     plot(y(~in),x(~in),'r.')
%     plot(y(in),x(in),'g.')
    
    In=[];
    for k=1:length(B1)
        boundary=B1{k};
        in=inpolygon( y,x,boundary(:,2),boundary(:,1));%������������in=1
        plot(y(~in),x(~in),'r.')
        plot(y(in),x(in),'g.')
        hold on
        In=[In in];
    end
    set(gca,'YDir','reverse')
   