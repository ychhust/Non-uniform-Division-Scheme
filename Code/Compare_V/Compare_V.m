
load visibility V1
load visibility_non V1_non
save visibility_ideal Vr
figure(5)
plot(abs(Vr-V1),'b','LineWidth',2)
hold on
plot(abs(Vr-V1_non),'r','LineWidth',2)
legend('均匀划分','不均匀划分')
title('相同点数均匀与不均匀场景划分可见度误差')