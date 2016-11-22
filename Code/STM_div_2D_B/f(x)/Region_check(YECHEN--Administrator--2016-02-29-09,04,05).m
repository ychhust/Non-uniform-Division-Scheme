function [in1,in2]=Region_check(x,y,M1,M2)


%     I1 = imread('Earth_pic.jpg');
%     BW1 = im2bw(I1, graythresh(I1));
%     [B1,L1] = bwboundaries(BW1,'noholes');
%     I2 = imread('pic.jpg');
%     BW2 = im2bw(I2, graythresh(I2));
%     [B2,L2] = bwboundaries(BW2,'noholes');
%     M1=cell2mat(B1);
%     M2=cell2mat(B2);
%     load Earth_data
%     row_pix = size(A,1);
%     col_pix = size(A,2);
%     point=zeros(row_pix*col_pix,2);
%     count=0;
%     for i=1:row_pix
%         for j=1:col_pix
%             count=count+1;
%             point(count,1)=i;
%             point(count,2)=j;
%         end
%     end
% 
%     y=point(:,1);
%     x=point(:,2);
    in1=inpolygon( y,x,M1(:,2),M1(:,1));
    in2=inpolygon(y,x,M2(:,2),M2(:,1));
%     plot(M1(:,2),M1(:,1),'b', 'LineWidth', 2)
%     hold on
%     plot(M2(:,2),M2(:,1),'r', 'LineWidth', 2)
%     hold on
%     plot(y(in1&(~in2)),x(in1&(~in2)),'g.')
%     plot(y(~in1&(~in2)),x(~in1&(~in2)),'r.')
    plot(y(in1&(in2)),x(in1&(in2)),'b.')
    set(gca,'YDir','reverse')