clear all;
%  close all;

% ����
figure()
%%% ��ͼ
d=4;
x = -1:0.01:1;
for k = 1:length(x)
    y(k) = TB( x(k));
end
plot(x,y);
title('ԭʼͼ��')



% ���߳���
% d =0.5;
% �������ַ�ʽ ��0.1���ֵ���
n_k = 2:2:60;



% ����׼ȷֵ����Ϊ���ַ����㹻������
v_accurate = IntegralNorm(-1,1,10000,d);

%%%%% ���Ȼ���ʱ
% ���ֵ���
N_k = n_k*20;

for k = 1:length(N_k)
    sum_TB_norm(k) = IntegralNorm(-1,1,N_k(k),d);
end

figure()
plot(N_k,log(abs(v_accurate - sum_TB_norm)));

hold on

%%%%% �Ǿ��Ȼ���ʱ
%�������ַ�ʽ
% -1��-0.4֮��    0.5*n_k
% -0.4��-0.3֮��  5*n_k
% -0.3��0.2֮��   0.5*n_k
% 0.2��0.3֮��    5*n_k
% 0.3��1֮��      0.5*n_k

% ���ֵ���
N_k = n_k*(6*0.5+5+5*0.5+5+7*0.5);

for k = 1:length(N_k)

    d1 = IntegralNorm(-1,-0.4,6*0.5*n_k(k),d); 
    d2 = IntegralNorm(-0.4,-0.3,1*5*n_k(k),d);
    d3 = IntegralNorm(-0.3,0.2,7*0.5*n_k(k),d);
    d4 = IntegralNorm(0.2,0.3,1*5*n_k(k),d);
    d5 = IntegralNorm(0.3,1,7*0.5*n_k(k),d);
    sum_TB_non(k) = d1 + d2 +d3 + d4 + d5;
end

plot(N_k,log(abs(v_accurate - sum_TB_non)),'r')

title('�ɼ���ʵ���в�')
legend('���Ȼ��ֿɼ���','�Ǿ��Ȼ��ֿɼ���')
