figure(4)
plot(Fov0,T0,'r','LineWidth',2)
hold on 
plot(Fov0,T1,'b','LineWidth',2)
xlabel('�޻���ӳ���Χ')
ylabel('��������')
title('�������ݽ��')
legend('����ɼ��ȷ��ݽ��','ʵ�ʿɼ��ȷ��ݽ��')
hold on
for k=1:num
    plot([extentpoint_place_start(k) extentpoint_place_start(k)],[min(T0)-1 max(T0)+1],'g--')
    plot([extentpoint_place_end(k) extentpoint_place_end(k)],[min(T0)-1 max(T0)+1],'g--')
end