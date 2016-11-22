function in1=Region_check(x,y,M1)



    in1=inpolygon( y,x,M1(:,2),M1(:,1));
    plot(y(~in1),x(~in1),'r.')
    plot(y(in1),x(in1),'g.')
    set(gca,'YDir','reverse')