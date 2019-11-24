ball=dlmread('ball.txt');

%displaying image
ball_img=ball;
ball_img(ball_img<0)=0;
figure(1);
image(logical(ball_img));
colormap(gray(2))
%N=90*100=9000

S=reshape(ball,9000,1);

%weight matrix - entering image into neural network
W=S*S'/9000;
W(1:9001:end)=0;

%linearizing patch
rec=zeros(90,100);
rec(1:50,25:75)=ball(1:50,25:75);
R=reshape(rec,9000,1);
%displaying patch
rec_img=rec;
rec_img(rec_img<0)=0;
figure(2)
image(logical(rec_img));
colormap(gray(2))

%initial states of neurons
V0=zeros(9000,1);
V1=R;
rmsd(1)=rms(V1-S);

%image retrieval
for e=2:51
    V0=V1;
    V1=sign(W*V0);
    val=V1-S;
    rmsd(e)=rms(val);
    imgfinal=reshape(V1,90,100);
    imgfinal(imgfinal<0)=0;
    figure(3);
    image(logical(imgfinal));
    colormap(gray(2));
end

%RMSD plot
figure(4)
plot([1:51],rmsd)
xlabel('No of iterations')
ylabel('RMSD')
title('RMSD versus Number of Interations for Hopfield Network')
