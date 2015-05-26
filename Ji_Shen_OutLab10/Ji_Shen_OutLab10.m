% Name: Ji Shen
% Date: 11/23/2014
% Section: 203
% In-Lab 10

clear all
close all
clc


%% Problem 1 
clc;
clear;
vec = [20 18 0 3 -10 8 -5 3 9 13 23 42]
% call the function to get index
[a,d] = createIndexVecs(vec) 
vec(a)
vec(d)

%% Problem 2
clc
clear
close all
snowd = load('snowd.dat');
days = 1:length(snowd); % create vector of days
coefs = polyfit(days,snowd,2); % fit the points to 2 degree polynomial
r = roots(coefs); % solve the polynomial
gone = round(max(r)); % round the root to get which week snow gone
days2 = [min(r) days max(r)]; % create new x value for plot curve
curve = polyval(coefs, days2); % store the curve
plot(days,snowd,'ko', days2,curve,'b-');
axis([0,gone,0,max(snowd)]);
xlabel('# Weeks');
ylabel('Depth in inches');
title(sprintf('Sonw gone week %d',gone));
set(gca,'Color',[0.4,0.4,0.4]); % set the axis to grey

%% Problem 3
clc;clear
close all
% assign t as symbol
syms t
f = '90*exp(-30*t/65) = 10';
% solve the function and convert answer to double figure
double(solve(f))

%% Problem 4
clc;clear
vec = [5 8 2 4 6]; % input a vector to call function belowMean
belowMean(vec)

%% Problem 5
clc; clear;
% Part a
a = [-2 1;1 1];
b = [3; 10];
X11 = a\b % use left divide
X12 = inv(a)*b % use inverse function
% Part b
a = [5 3 -1;3 2 1;4 -1 3];
b = [10; 4; 12];
X21 = a\b
X22 = inv(a)*b
% Part c
a = [3 1 1 1;1 -3 7 1; 2 2 -3 4; 1 1 1 1];
b = [24; 12; 17;0];
X31 = a\b
X32 = inv(a)*b












