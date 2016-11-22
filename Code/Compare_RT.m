F=@(x)x.^5-10*x.^2+10*x-6.4;
I=quadl(@(x)F(x),-1,1);
m=linspace(-1,1,1000);
for k=1:length(m)-1
    delta=m(k+1)-m(k);
    c=(m(k+1)+m(k))/2;
    r(k)=(c^5-10*c^2+10*c-6.4)*delta;
    t1=m(k)^5-10*m(k)^2+10*m(k)-6.4;
    t2=m(k+1)^5-10*m(k+1)^2+10*m(k+1)-6.4;
    t(k)=(t1+t2)/2*delta;
end
I
R=sum(r)
T=sum(t)
abs(I-R)
abs(I-T)
