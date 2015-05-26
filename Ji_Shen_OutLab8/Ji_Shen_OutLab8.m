% Name Ji Shen
% Date 11/8/2014
% Section 203
% Out-Lab 8

clear all
close all
clc


%% Problem 1
% create the functio numbers as described

% run the test
numbers(3,2)
numbers(1,4,5)

%% Problem 2
% create the functio totalResistance as described

% run the test
totalResistance(10,20,100,5)
totalResistance(200,10,50)

%% Problem 3
% create the functio totalResistance as described

% run the test
mypower(2,4)

%% Problem 4
clear
clf;
hk = rectangle('Position',[0.5,0.5,4,2],'Curvature',[0.7,0.7]);
axis([0 5 0 3]);
line([2.5,2.5],[0.5,2.5],'Color','r','LineWidth',4);
title('Let''s play hokey!');

%% Problem 5
clear;
clf;
x = -2*pi:pi/100:2*pi;
y = sin(x);
h = plot(x,y); % get a handle for this plot
set(h,'Color', 'g', 'LineWidth',2, 'LineStyle', '--'); % customizing the plot
set(gcf,'Color', 'r', 'Name', 'A Sine Function') % customizing the figure
set(gca, 'Color', 'b', 'Xscale', 'log'); % customizing the axis
axis tight;

%% Problem 6
close all;
plotVarLineWidth(x,y,6,[1 1 0]);








