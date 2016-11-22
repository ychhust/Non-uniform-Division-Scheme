% clc;
% close all;
% [Z refvec]=gtopo30('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\原始数据\e100s10\E100S10',1);
% Z=flipud(Z);
% Z((isnan(Z)==1))=0;
% A=Z(2200:2800-1,3000:3500-1);
% % [m,n]=find(A>=500);
% % A=Z;
% A(A>=250)=A(A>=250)/30+250;
% % A(A<90)=0;
% % A(A<90)=A(A<90)/10+90;
% % A((A<120)&(A>95))=A((A<120)&(A>95))/5+110;
% B=(A<=250&A>0);
% figure()
% imagesc(A)
% colorbar

load('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D_B\T_2D_Earth.mat');%矩阵导入
A = abs(pic);
B=(A>220);
imwrite(A,'E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_pic.jpg');
imwrite(B,'E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\pic.jpg');
% A=A+80;
save ('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_data.mat','A');


% I=imread('Earth_pic.jpg');
% result1=Edge_check(I);
% T=imread('pic.jpg');
% result2=Edge_check(T);
% result=result1+result2;
% figure()
% imshow(result)
% [Z,refvec]=gtopo30('W100N90',1,latlim,lonlim);
% usamap(Z,refvec);
% geoshow(Z,refvec,'DisplayType','surface')
% demcmap(Z)

I1 = imread('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_pic.jpg');
BW1 = im2bw(I1, graythresh(I1));
[B1,L1] = bwboundaries(BW1,'noholes');
I2 = imread('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\pic.jpg');
BW2 = im2bw(I2, graythresh(I2));
% [B2,L2] = bwboundaries(BW2,'noholes');
[B2,L2] = bwboundaries(BW2);
M1=cell2mat(B1);
% M2=cell2mat(B2);
load ('E:\综合孔径辐射计\百度云同步盘\非均匀划分算法\代码\STM_div_2D\Earth_data.mat')
row_pix = size(A,1);
col_pix = size(A,2);
% point=zeros(row_pix*col_pix,2);
% count=0;
figure()
% plot(M1(:,2),M1(:,1),'b', 'LineWidth', 2)
% hold on
% plot(M2(:,2),M2(:,1),'r', 'LineWidth', 2)
% hold on
% set(gca,'YDir','reverse')
for k=1:length(B2)
    boundary=B2{k};
    plot(boundary(:,2),boundary(:,1),'r', 'LineWidth', 2)
    hold on
end
% i=1;
% j=1;
% % delta=[;;];
% while (i<=row_pix)
%     while (j<=col_pix)
%         %         count=count+1;
%         %         point(count,1)=i;
%         %         point(count,2)=j;
%         [in1,in2]=Region_check(i,j,M1,M2);
%         if(in1&&(~in2))
%             if(c==13)
%                 j=j-6;
%                 c=6;
%             else
%                 j=j+4;
%                 %                 c=1;
%             end
%         else
%             c=13;
%             j=j+c;
%             %                 c=3;
%         end
%         %             l=[i;j;c];
%         %             delta=[delta l];
%     end
%     j=1;
%     i=i+6;
% end

% x=point(:,1);
% y=point(:,2);
% in1=inpolygon(y,x,M1(:,2),M1(:,1));
% in2=inpolygon(y,x,M2(:,2),M2(:,1));
% % plot(M1(:,2),M1(:,1),'b', 'LineWidth', 2)
% % hold on
% % plot(M2(:,2),M2(:,1),'r', 'LineWidth', 2)
% % hold on
% plot(x(in1&(~in2)),y(in1&(~in2)),'g.')
% set(gca,'YDir','reverse')

% L = linspace(0,2.*pi,6); xv = cos(L)';yv = sin(L)';
% xv = [xv ; xv(1)]; yv = [yv ; yv(1)];
% x = randn(250,1); y = randn(250,1);
% in = inpolygon(x,y,xv,yv);
% plot(xv,yv,x(in),y(in),'r+',x(~in),y(~in),'b*')