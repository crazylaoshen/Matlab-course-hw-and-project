% Name Ji Shen
% Date 11/8/2014
% Section 203
% Out-Lab 8

clear all
close all
clc

%% Problem 1
A = imread('photo1.jpg');
n = randi(100,1,2); % randomly generate 2 numbers
[r,c,p] = size(A);
% add and minus the 2 random number from the image matrix
B = A - n(1)*uint8(ones(r,c,p));
C = A + n(2)*uint8(ones(r,c,p));
% show the images by pairs
subplot(2,2,1)
imshow(A);
subplot(2,2,2)
imshow(B);
subplot(2,2,3)
imshow(A);
subplot(2,2,4)
imshow(C);


%% Problem 2

CosPlotGui


%% Problem 3
clear;
close all;
% create my colormap
mycolors = [1 1 1; 0 0 1; 1 0 0];
colormap(mycolors);
M = ones(10);
image(M);
% set the random elements of answer
a = randi(10);
b = randi(10);
% prompt user to guess the answer
c = input('Enter the row # : ');
d = input('Enter the col # : ');
while c ~= a|d ~= b;
    M(c,d) = 3;  %wrong guess will become red
image(M);
c = input('Enter the row # : ');
d = input('Enter the col # : ');

end
M(a,b) = 2;  % right answer becomes blue
image(M);

%% Problem 4
clear;
close all;
mat = randi(64,10,10); % create the mat consist of random colors
subplot(1,2,1);  % plot mat
image(mat);
mycolors = [jet; 1 1 1]; % add white color to jet colormap
colormap(mycolors);
% create new matrix include blue area
mat2 = mat;
mat2(mat2>16) = 65;    
subplot(1,2,2); % plot mat2
image(mat2);


%% Problem 5
clear;
close all;
%file to store the animation movie
writerObj = VideoWriter('static.avi');
open(writerObj);  % open the movie file
mycolors = [1 1 1;0 0 0];
colormap(mycolors);

for k = 1:200;
    mov = randi(2,50,50);
    image(mov);
    M(k) = getframe;%capture each frame
    writeVideo(writerObj,M(k)); %also send to file
end
movie(M) % play the movie based on the captured frames
close(writerObj) % close the movie file

%% Problem 6
clear;
close all;
mycolors = [1 1 1;jet]; % add white to jet
colormap(mycolors);% create new colormap
% call function ranwalk twice
A = ranwalk(8);
B = ranwalk(100);
% plot two matrix
subplot(1,2,1)
image(A);
subplot(1,2,2)
image(B);














