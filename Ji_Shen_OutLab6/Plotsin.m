function Plotsin( num_1, num_2 )
% Function plotSine graphically demonstrate the difference in plotting the sin function 
% with a different number of points in the range from 0 to 2pi
% Inputs: 
% num_1 - number of points between 0 and 2pi for first plot
% num_2 - number of points between 0 and 2pi for second plot
% Returns: NA


% Uniformly generate points between 0 and 2*pi
a = linspace(0,2*pi,num_1);
b = linspace(0,2*pi,num_2);
% Plot the comparative figures of sine(a) and sine(b) 
h(1) =subplot(2,1,1);
plot(a,sin(a),'-*')
title(sprintf('%d points',num_1));
h(2) =subplot(2,1,2);
plot(b,sin(b),'-*')
title(sprintf('%d points',num_2));
linkaxes(h);
xlim([0,7]);
ylim([-1,1]);
end

