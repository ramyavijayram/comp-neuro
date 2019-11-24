pics(:,:,1)=dlmread('ball.txt');
pics(:,:,2)=dlmread('cat.txt');
pics(:,:,3)=sign(dlmread('mona.txt'));

%displaying images
for i=1:3
    img=pics(:,:,i);
    img(img<0)=0;
    figure(i);
    image(logical(img));
    colormap(gray(2))
end
%initializing weight matrix
W=zeros(9000,9000);

%linearizing patterns and saving images in neural network
for i=1:3
    S(:,i)=reshape(pics(:,:,i),9000,1);
    W=W+S(:,i)*S(:,i)'/9000; %weight matrix
end
%patches
for i=1:3
    patch(:,:,i)=zeros(90,100);
    patch(1:50,25:75,i)=pics(1:50,25:75,i);
    R(:,i)=reshape(patch(:,:,i),9000,1);
    rec_img=patch(:,:,i);
    rec_img(rec_img<0)=0;
    figure(3+i)
    image(logical(rec_img));
    colormap(gray(2))
end
%choose image: 1 - ball; 2 -cat; 3-Mona Lisa
j=3;
img=S(:,j);
V0=zeros(9000,1);
V1=R(:,j);

%forgetting some % of the weights - 0,25,50,80:
forg=[0,25,50,80];

%select percentage
i=4;
if forg(i)~=0
    n=9000*9000*forg(i)/100;
    W(randperm(numel(W), n)) = 0;
end

%RMSD initialization
rmsd(1)=rms(img-V1);

%retrieval of image from neural network
for e=2:51
    V0=V1;
    V1=sign(W*V0);
    val=V1-img;
    rmsd(e)=rms(val);
    imgfinal=reshape(V1,90,100);
    imgfinal(imgfinal<0)=0;
    figure(7);
    image(logical(imgfinal));
    colormap(gray(2));
end

%rmsd plot
figure(8)
plot([1:51],rmsd)
xlabel('No of iterations')
ylabel('RMSD')
title('RMSD versus Number of Interations for Hopfield Network')