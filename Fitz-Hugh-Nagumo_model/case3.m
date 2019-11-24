a=0.5;
b=0.1;
r=0.1;

%I1=0.2594; I2=0.7406
Im=0.8 %0.8>0.7406
g=@(v,w)[b*v-r*w]; %w nullcline
F=@(v,w)[v*(a-v)*(v-1)-w + Im]; %v nullcline

figure('Name','Phase Plot, case 2')
ez1=ezplot(F, [-2,2,-2,2]);
hold on
ezplot(g,[-2,2,-2,2])
set(ez1,'color',[1 0 0])
%fixed point
syms x y
[solx,soly] = vpasolve([x*(0.5-x)*(x-1)-y + Im==0],[0.1*x-0.1*y==0])
%(0.845,0.845) is the only real root. It is the fixed point

%Euler's forward integration
%v(0)<a and w(0)=0
%perturbation from fixed point by v=0.01, w=0.01 such that starting points
%are as given below
v(1)=vpa(solx(1),3)+0.01;
w(1)=vpa(solx(1),3)+0.01;
t(1)=0;
h=0.1;
for s=2:1000
    v(s)=v(s-1)+(v(s-1)*(a-v(s-1))*(v(s-1)-1)-w(s-1) + Im)*h;
    w(s)=w(s-1)+(b*v(s-1)-r*w(s-1))*h;
    t(s)=t(s-1) + h;
end

figure('Name','V(t) vs t, case 3');
plot(t,v)

figure('Name','W(t) vs t, case 3');
plot(t,w)

figure(4);
plot(v,w)

figure('Name', 'Trajectory');
plot(v,w);
hold on
ez1=ezplot(F,[0.82,0.86,0.82,0.86]);
hold on
ezplot(g,[0.82,0.86,0.82,0.86]);
set(ez1,'color',[1 0 0])

