function [ randsorted ] = wordScramble( string )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = string;
ind = randperm(length(a));
randsorted = a(ind);


end

