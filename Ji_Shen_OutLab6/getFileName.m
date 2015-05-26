function [ fileName ] = getFileName
% Function getFileName prompt the user separately for a filename and extension and will 
% create and return a string with the form ‘filename.ext’. 
% Input: NA
% Output: 
% filename - a file name with extension input by user

file = input('Please enter the file name: ', 's');
ext = input('Please enter the extension of file: ', 's');

fileName = [file '.' ext];


end

