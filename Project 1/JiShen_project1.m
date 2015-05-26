% Name Ji Shen
% Date  09/10/2014
% Lab Section #203
% Project 1: Truss Evaluation Project
% Description of Assignment

%% load the Data into Matlab
clc
clear
% Part a 
mat = csvread('truss.csv',1,0,[1,0,16,8]); % Create matrix for nodes
A = mat(:,[1,6:end]); % select required columns
% Part b
B = csvread('truss.csv',20,0,[20,0,48,2]); % Create matrix B for members

%% Manipulating the Data
% Part a
dis_x = A(:,2); % select the colomn of nodal displacement in x direction
[maxdis_x,disindex_x]=max(abs(dis_x)); % find the maximum displacement in x direction and the nodal index
dis_y = A(:,3); % select the colomn of nodal displacement in y direction
[maxdis_y,disindex_y]=max(abs(dis_y)); % find the maximum displacement in y direction and the nodal index
fprintf('The maximum nodal displacement in the x direction is %5.3f and occurs at node %d.\n', maxdis_x,disindex_x)
fprintf('The maximum nodal displacement in the y direction is %5.3f and occurs at node %d.\n', maxdis_y,disindex_y)

% Part b
for_x = A(:,4); % select the colomn of nodal force in x direction
[maxforce_x,forindex_x]=max(abs(for_x)); % find the maximum force in x direction and the nodal index
for_y = A(:,5); % select the colomn of nodal force in y direction
[maxforce_y,forindex_y]=max(abs(for_y));% find the maximum force in x direction and the nodal index
fprintf('The maximum nodal force in the x direction is %8.3f and occurs at node %d.\n', maxforce_x,forindex_x)
fprintf('The maximum nodal force in the y direction is %8.3f and occurs at node %d.\n', maxforce_y,forindex_y)

% Part c
axialforce = B(:,3); % select the colomn of acial force on members
[max_axialforce,axialindex]=max(abs(axialforce)); % find the maximum force in a member and the member index
n1 = B(axialindex,1); % find the member of N1
n2 = B(axialindex,2); % find the member of N2
fprintf('The maximum axial force is %8.3f and occurs on the member between points %d and %d.\n', max_axialforce,n1,n2)


%% Plotting

% Part a
c_x = sum(for_x < 0);  % find the number of negetive value for x-axis
t_x = sum(for_x > 0);  % find the number of positive value for x-axis
n_x = sum(for_x == 0); % find the number of neutral value for x-axis
x1=[c_x, t_x, n_x];

c_y = sum(for_y < 0);  % find the number of negetive value for y-axis
t_y = sum(for_y > 0);  % find the number of positive value for y-axis
n_y = sum(for_y == 0); % find the number of neutral value for y-axis
x2=[c_y, t_y, n_y];
% plot the bar graph
figure(1);
subplot(2,1,1);
bar(x1,'g')  % plot first graph with green color
title('Nodal Force Directions')  % set title
ylabel('Number of Members') % set y label
axis([0.5,3.5,0,15])  % set scaling for the x and y axes
set(gca,'XTickLabel',{'Compressive','Tensile','Neutral'})  % set string character as the label in x-axis

subplot(2,1,2);
bar(x2,'r')   % plot first graph with red color
title('Nodal Force Directions')  % set title
ylabel('Number of Members') % set y label
axis([0.5,3.5,0,15])  % set scaling for the x and y axes
set(gca,'XTickLabel',{'Compressive','Tensile','Neutral'}) % set string character as the label in x-axis

%% Part b
figure(2); % Plot a new figure
scatter(dis_x,dis_y,'*','k');  % use scatter to plot nodal displacement in x and y direction
xlabel('Displacement in X Direction');  % set x label
ylabel('Displacement in Y Direction');  % set y label
title('Nodal Displacement');  % set title
