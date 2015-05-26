%%

function plotMoods(states, avgMoodState, dataFileName)
%creates a visualization of the US, where each state is assigned a color
%based on its average mood sentiment.  It does NOT show AK, HI and PR!
%Inputs: states: structure array provided in states.mat
%        avgMoodState: 1x52 array with avg mood b/n [-1,1] for each state 
%        dataFileName: a string that contains the name of the data


hold;
x = []; y = [];
for i=2:length(states) %don't plot AK
    if (i ~=40 && i~= 12) %don't plot AR or HI
        for j=1:length(states(i).region)
            x =  [states(i).region{j}.longitude ];
            y =  [states(i).region{j}.latitude ];
            fill(y,x, getColor(avgMoodState(i)));
        end
    end
end
title(dataFileName);
axis equal;


end

