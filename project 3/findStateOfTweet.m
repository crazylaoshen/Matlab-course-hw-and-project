function state = findStateOfTweet( tweetLoc, centroidsData )
%Assign a tweet to the state has that has its centroidsData closest to
%the geo location of the tweet using haversine formula
% Inputs: 
%  tweetLoc: a 1 x 2 vectors [latitude, longitude]
%  centroidsData: cell arrays that contains all the data from centroids.xlsx
% Returns:
%  state; a string that has the state abbreviation, e.g. 'NC' for the North
%  Carolina

dist = zeros(52,1);
% use loop to call haversine function to calculate distance
for i = 1:52
loc = [centroidsData{i,2},centroidsData{i,3}];
dist(i) = haversine(tweetLoc,loc);
end
distM = min(dist); % caculate the nearest state sentroid point
states = centroidsData(:,1);  % get all the state for pick up
state = states{dist == distM}; % pick up the state using logical index

end

