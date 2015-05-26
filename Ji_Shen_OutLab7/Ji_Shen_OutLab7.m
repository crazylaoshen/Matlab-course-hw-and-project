% Name  Ji Shen
% Date  10/24/2014
% Section 203   
% Out-Lab 7

clear all
close all
clc

%% Problem 1

% Load in the data given on the Moodle page using xlsread
milling = xlsread('milling.xlsx');
[r,~] = size(milling);  % get the rows of data
% use loop to convert matrix to structure data
for i = 1:r
millData(i) = struct('PartNumber',milling(i,1),'IdealWeight',milling(i,2),'Trial',milling(i,(3:7)));
end
% use loop to comupute mean of trails and compare each of them
for i = 1:r
if mean(millData(i).Trial) > millData(i).IdealWeight
    fprintf('For part %d, the average weight is greater than the ideal weight.\r',i);
elseif mean(millData(i).Trial) == millData(i).IdealWeight
    fprintf('For part %d, the average weight is equal to the ideal weight.\r',i);
elseif mean(millData(i).Trial) < millData(i).IdealWeight
    fprintf('For part %d, the average weight is less than the ideal weight.\r',i);
end
end

%% Problem 2
clc;
clear;
% Part a
metal = {'Aluminum','Copper','Iron','Molybdemum','Cobalt','Vanadium'};
symbol = char('Al','Cu','Fe','Mo','Co','V');
atomicN = int8([13,29,26,42,27,23]);
atomicW = [26.98,63.55,55.85,95.94,58.93,50.94];
density = single([2.71,8.94,7.87,10.22,8.9,6.0]);
crystalS = char('FCC','FCC','BCC','BCC','HCP','BCC');
% Part b
elementData = {metal,symbol,atomicN,atomicW,density,crystalS};
% Part c 
% i) The name, atomic weight, and structure of Cobalt
Cobalt = [elementData{1}(5), elementData{4}(5), elementData{6}(5,:)]
% ii) The names of all elements
NameAll = elementData{1}
% iii) 
avrWeight = mean(elementData{4})

%% Problem 3
% use loop to convert cellarray to structure data
for i = 1 : length(metal) 
elementS(i) =  struct('metal',metal{i},'symbol',symbol(i,:),'atomicN',atomicN(i),'atomicW',atomicW(i),...
    'density',density(i),'crystalS',crystalS(i,:));
end
k = length(elementS); % the number of elements in data
% input additional element in data
elementS(k+1).metal = input('Enter an element name : ','s');
elementS(k+1).symbol = input('Enter the symbol : ','s');
elementS(k+1).atomicN = input('Enter the atomic number : ','s');
elementS(k+1).atomicW = input('Enter the atomic weight : ','s');
elementS(k+1).density = input('Enter the density : ','s');
elementS(k+1).crystalS = input('Enter the structure : ','s');

%% Problem 4
% Part a 
clc
clear;
cellData = cell(2,4); % create cellarray with dimension of 2*4
cellData{1,1} = 'Shelley Lake'; cellData{2,1} = 'Jordan lake';
cellData{1,2} = 'June 13,2013'; cellData{2,2} = 'June 14,2013';
cellData{1,3} = [60,72,62]; cellData{2,3} = [66,80,64];
cellData{1,4} = [55,55,56;54,56,55]; cellData{2,4} = [60,70,61;62,72,62;61,71,61];
% Part b
[r,~]= size(cellData); % get the rows in data
% use loop to print out the result for each object in data
for k = 1:r
    fprintf('%s ,%s, Avg Air Temp = %.2f and Avg Water Temp = %.2f\n',cellData{k,1},cellData{k,2},...
        mean(cellData{k,3}),mean(mean(cellData{k,4})))
end

%% Problem 5
n = input('How many vectors you want to enter?: ');
cellV = cell(1,n);
for k = 1:n
    msg = sprintf('Enter vector%d : ',k);
    cellV{1,k} = input(msg);
end
for k = 1:n
    fprintf('The length of vector%d is %d \n',k,length(cellV{k}))
end

