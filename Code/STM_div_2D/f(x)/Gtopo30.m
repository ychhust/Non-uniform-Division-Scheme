clc;
close all;
[Z refvec]=gtopo30('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\原始数据\e100s10\E100S10',1);
Z=flipud(Z);
Z((isnan(Z)==1))=0;
imagesc(Z)
% A=Z(2400:2750-1,3150:3550-1);
A=Z(2350:2750-1,3150:3550-1);
% A=fliplr(A');
% M=Z(2400:2750-1,3150:3550-1);
% [m,n]=find(A>=500);
% A=Z;
A(A>=110)=A(A>=110)/30+110;
% A(A<90)=0;
% A(A<90)=A(A<90)/10+90;
% A((A<120)&(A>95))=A((A<120)&(A>95))/5+110;
B=(A<=110&A>0);
figure()
imagesc(A)
colorbar
imwrite(A,'E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_pic.jpg');
imwrite(B,'E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\pic.jpg');
% T=zeros(406,406);
% T(7:406,7:406)=A;
save ('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_data.mat','A');



I1 = imread('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_pic.jpg');
BW1 = im2bw(I1, graythresh(I1));
[B1,L1] = bwboundaries(BW1,'noholes');
I2 = imread('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\pic.jpg');
BW2 = im2bw(I2, graythresh(I2));
[B2,L2] = bwboundaries(BW2,'noholes');
M1=cell2mat(B1);
M2=cell2mat(B2);
load ('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_data.mat')
row_pix = size(A,1);
col_pix = size(A,2);

figure()
plot(M2(:,2),M2(:,1),'r', 'LineWidth', 2)
hold on
set(gca,'YDir','reverse')
