
load visibility V1
load visibility_non V1_non
save visibility_ideal Vr
figure(5)
plot(abs(Vr-V1),'b','LineWidth',2)
hold on
plot(abs(Vr-V1_non),'r','LineWidth',2)
legend('���Ȼ���','�����Ȼ���')
title('��ͬ���������벻���ȳ������ֿɼ������')