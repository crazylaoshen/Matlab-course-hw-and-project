% Name Ji Shen
% Date  11/18/2014
% Lab Section #203
% Project 3: TweetAnalyzer



clear; clc; close all;
% create the menu
choice = menu('Data to analyze','bacon','cat','dog','bieber');
keywords = {'bacon','cat','dog','bieber'};
% create file name accrording to user's choice
filename = [keywords{choice},'.','txt'];
[score,words] = xlsread('sentiments.xlsx'); % load the dictionary
fid = fopen(filename);  
if fid == -1
    disp('File open not successful')
else
    tweet= zeros(2500,3);
   k = 1;%  initialize number of tweets
    while ~feof(fid)
% Read one line into a String variable
        aLine = fgetl(fid);        
        %tokenize that line based on the format & delimiter
        tokens = textscan(aLine, '%s');
        %concatenate the new line
        tokens = lower(tokens{:});
        % concatenate the geographic information
        geo = [str2num(tokens{2}),str2num(tokens{4})];
        % check if there is words in the sentimental dictionary
        lia = ismember(tokens,words);
        if sum(lia) ~= 0;
        w = tokens(lia);
        s = zeros(1,length(w)); % preallocate space for score
        for i = 1:length(w)
        index = strcmp(words, w(i)); % get the index of words in dictionary 可能不用find
        s(i) = score(index);
        end
        sAverage = mean(s);
        % gather the geographic information along with the score of each
        % tweet
        tweet(k,:) = [geo,sAverage];
          
        k = k+1;% increment k
        
        end
    end
    tweet = tweet(any(tweet,2),:);
    closeresult = fclose(fid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end

%%  Calculate distance and assign each tweet to state
[L,S,centroidsData] = xlsread('centroids.xlsx','A2:C53');
% find the state
stweet= cell(k-1,1);
for i = 1: (k-1);
   stweet{i,1} = findStateOfTweet( tweet(i,(1:2)), centroidsData ) ;
end

%%  index the state and find the sentiments
mood = tweet(:,3);
avgMoodState = zeros(1,length(S));
for i = 1 : length(S)
    avgMoodState(i) = mean(mood(strcmp(S{i},stweet))) ;
end
load('states.mat');
% plot the trend map
plotMoods(states, avgMoodState, keywords{choice});










