% help judge whether a network is pairwise stable
k=4.56;
x0 = [1,0,1]
x = 0:0.01:1;
y1 =zeros(101,1);
z1 =zeros(101,1);
y2 =zeros(101,1);
z2 =zeros(101,1);
y3 =zeros(101,1);
z3 =zeros(101,1);
for i=1:101
    %12
    y1(i) = log(2+x(i)+x0(2))/(log(2+x(i)+x0(2))+log(2+x(i)+x0(3))+log(k+x0(2)+x0(3)));
    z1(i) = log(2+x(i)+x0(3))/(log(2+x(i)+x0(2))+log(2+x(i)+x0(3))+log(k+x0(2)+x0(3)));
    %13
    y2(i) = log(2+x0(1)+x(i))/(log(2+x0(1)+x(i))+log(2+x0(1)+x0(3))+log(k+x(i)+x0(3)));
    z2(i) = log(k+x(i)+x0(3))/(log(2+x0(1)+x(i))+log(2+x0(1)+x0(3))+log(k+x(i)+x0(3)));
    %23
    y3(i) = log(2+x0(1)+x(i))/(log(2+x0(1)+x0(2))+log(2+x0(1)+x(i))+log(k+x0(2)+x(i)));
    z3(i) = log(k+x0(2)+x(i))/(log(2+x0(1)+x0(2))+log(2+x0(1)+x(i))+log(k+x0(2)+x(i)));
end
subplot(3,2,1)
plot(x,y1)
title('12-1')
subplot(3,2,2)
plot(x,z1)
title('12-2')
subplot(3,2,3)
plot(x,y2)
title('13-1')
subplot(3,2,4)
plot(x,z2)
title('13-3')
subplot(3,2,5)
plot(x,y3)
title('23-2')
subplot(3,2,6)
plot(x,z3)
title('23-3')
