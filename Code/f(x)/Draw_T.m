figure(4)
plot(Fov0,T0,'r','LineWidth',2)
hold on 
plot(Fov0,T1,'b','LineWidth',2)
xlabel('无混叠视场范围')
ylabel('场景亮温')
title('场景反演结果')
legend('理想可见度反演结果','实际可见度反演结果')
hold on
for k=1:num
    plot([extentpoint_place_start(k) extentpoint_place_start(k)],[min(T0)-1 max(T0)+1],'g--')
    plot([extentpoint_place_end(k) extentpoint_place_end(k)],[min(T0)-1 max(T0)+1],'g--')
end