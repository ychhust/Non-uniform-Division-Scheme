function result=Edge_check(image)


[x y z]=size(image);
if z==1
    result=edge(image,'canny');
elseif z==3
    image1=rgb2ycbcr(image);
    dx1=edge(image1(:,:,1),'canny');
    dx1=dx1*255;
    image2(:,:,1)=dx1;
    image2(:,:,2)=image1(:,:,2);
    image2(:,:,3)=image1(:,:,3);
    result=ycbcr2rgb(unit8(image2));
end


% figure()
% imshow(result2)
% imagesc(result)




