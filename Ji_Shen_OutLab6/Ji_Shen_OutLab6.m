
% Name Ji Shen
% Date 10/21/2014
% Section #203
% Assignment OutLab 6

%% Problem 1
% Call the function plotsin which graphically demonstrate 
% the difference in plotting the sin function 
plotsin(5,30) 

%% Problem 2
% Call the fuction wordScramble which order the letters randomly
wordScramble('fantastic');  

%% Problem 3
clear;
fid = fopen('planets.txt');  % Assumes opening for reading
if fid == -1
    disp('File open not successful')
else
    headingsLine = fgetl(fid); %read headings line
    %read all the data from the file at once
    planetsData = textscan(fid,'%s %f %d %d %f %f %f %f', 'Delimiter', ',');
    
    %put together new string
    for i=1:length(planetsData{1})
        newLine = [planetsData{1}{i} ' ' num2str(planetsData{5}(i))];
        disp(newLine);
    end
        
end

%% Problem 4

clear;
% prompt user for name to be read and open
file = input('PLEASE INPUT FILE NAME TO BE READ:','s');
fid = fopen(file,'r');
% loop error-check until valid filename can be opened
% print file name and close file
while fopen(file) == -1
        file = input('PLEASE INPUT FILE NAME TO BE READ:','s');
end

%% Problem 5
% Part a
A = [1,4,6;3,15,24;2,3,4]; % the default format is double-precision floating point
B = single(A); % convert it to single-precision floating point
C = int8(A); % convert it to signed integer with 8 bits
D = uint8(A); % convert it to unsigned integer with 8 bits
% Part b
E = A + B;
whos E; % it shows the data type is single
% part c
x = int8(1);
y = int8(3);
z = x/y;  % z = 0
whos z;  % it shows z is integer class data same as x and y
x_1 = int8(2);
z_1 = x_1/y;  % z_1 = 1, the result just round to integer value

%% Problem 6
filename = getFileName; % call the function to return a filename with prompt

