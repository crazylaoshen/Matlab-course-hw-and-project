function vecp = belowMean( vec )
% belowMean will print out the elements of vector which less than the mean
% Input: vec - vector
% Returns: vecp - elements which less than the mean

a = sort(vec);% sort the input vector
m = mean(a); % find mean of the vector
vecp = [];
% use loop the find elements less than mean
for i = 1:length(a)
    if a(i) <= m
        vecp = [vecp a(i)];
    end
end

end

