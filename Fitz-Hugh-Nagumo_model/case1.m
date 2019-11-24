a=0.5;
b=0.1;
r=0.1;

g=@(v,w)[b*v-r*w]; %w nullcline
F=@(v,w)[v*(a-v)*(v-1)-w]; %v nullcline

figure('Name','Phase Plot, Case 1');
ez1=ezplot(F, [-2,2,-2,2]);
hold on
ezplot(g,[-2,2,-2,2])
set(ez1,'color',[1 0 0]) 

%Euler's forward integration
%v(0)<a and w(0)=0
v(1)=0.3;
w(1)=0;
t(1)=0;
h=0.1;
for s=2:1000
    v(s)=v(s-1)+(v(s-1)*(a-v(s-1))*(v(s-1)-1)-w(s-1))*h;
    w(s)=w(s-1)+(b*v(s-1)-r*w(s-1))*h;
    t(s)=t(s-1) + h;
end
%trajectory
figure('Name', 'V(t) vs T, case 1-i');
plot(t,v)

figure('Name', 'W(t) vs T, case 1-i');
plot(t,w)

figure('Name', 'Trajectory, case 1-i');
plot(v,w);
hold on
ez1=ezplot(F,[-0.1,0.3,-0.1,0.3]);
hold on
ezplot(g,[-0.1,0.3,-0.1,0.3]);
set(ez1,'color',[1 0 0]) 

%Euler's forward integration
%v(0)>a and w(0)=0
v(1)=0.6;
w(1)=0;
t(1)=0;
h=0.1;
for s=2:1000
    v(s)=v(s-1)+(v(s-1)*(a-v(s-1))*(v(s-1)-1)-w(s-1))*h;
    w(s)=w(s-1)+(b*v(s-1)-r*w(s-1))*h;
    t(s)=t(s-1) + h;
end
%trajectory
figure('Name', 'V(t) vs T, case 1-ii');
plot(t,v)

figure('Name', 'W(t) vs T, case 1-ii');
plot(t,w)

figure(7)
plot (v,w)

figure('Name', 'Trajectory, case 1-ii');
plot(v,w);
hold on
ez1=ezplot(F,[-0.2,0.6,-0.1,0.3]);
hold on
ezplot(g,[-0.2,0.6,-0.1,0.3]);
set(ez1,'color',[1 0 0]) 
    