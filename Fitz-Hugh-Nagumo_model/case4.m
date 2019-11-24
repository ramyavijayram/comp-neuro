a=0.5;
Im=0.05;
b=0.012
r=0.1

%differentiating F=0 w. r. t v to give D
p=[3 -3 0.5];
solv=roots(p)
%slope calculation
for i=1:2
    solw(i)=solv(i)*(a-solv(i))*(solv(i)-1)+Im 
end
slope=(solw(2)-solw(1))/(solv(2)-solv(1))%slope not dependent on Im

%slope=0.12<0.1667
%0<b/r<0.1667
%by varying the values for b, r and Im, the required phase plot is found

g=@(v,w)[b*v-r*w]; %w nullcline
F=@(v,w)[v*(a-v)*(v-1)-w + Im]; %v nullcline

figure('Name','Phase Plot, case4');
ez1=ezplot(F,[-0,1,-0.2,0.2]);
hold on
ezplot(g, [-0,1,-0.2,0.2]);
set(ez1,'color',[1 0 0])

%suitability
syms x y
[solx,soly] = vpasolve([b*x-r*y==0],[x*(a-x)*(x-1)-y+Im==0]);

%p3=(0.813, 0.097) ,p1=(0.106, 0.013) p2= (0.581, 0.007), in that order, are i=1,2,3.

for i=1:3
    V=vpa(solx(i),3)
    delta(i)=(-3*V^2+3*V-0.5)*(-r);
    tou(i)=(-3*V^2+3*V-0.5);
end  
delta
tou
%at p3
v(1)=vpa(solx(1)+0.01,3);
w(1)=vpa(soly(1)+0.01,3);
t(1)=0;
h=0.1;
for s=2:200
    v(s)=v(s-1)+(v(s-1)*(a-v(s-1))*(v(s-1)-1)-w(s-1) + Im)*h;
    w(s)=w(s-1)+(b*v(s-1)-r*w(s-1))*h;
    t(s)=t(s-1) + h;
end

figure('Name','V(t) vs t, case 4 -P3');
plot(t,v)

figure('Name','W(t) vs t, case 4 -P3');
plot(t,w)

%at p2
v(1)=vpa(solx(3)+0.01,3);
w(1)=vpa(soly(3)+0.01,3);
t(1)=0;
h=0.1;
for s=2:200
    v(s)=v(s-1)+(v(s-1)*(a-v(s-1))*(v(s-1)-1)-w(s-1) + Im)*h;
    w(s)=w(s-1)+(b*v(s-1)-r*w(s-1))*h;
    t(s)=t(s-1) + h;
end

figure('Name','V(t) vs t, case 4 -P1');
plot(t,v)

figure('Name','W(t) vs t, case 4 -P1');
plot(t,w)



