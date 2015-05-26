function [ascind, desind] = createIndexvecs( vec )
% createIndexVecs function creates two index vectors:
%   for ascending order and descending order
% Input: vec - the vector to sort
% Returns: ascind - index vector in ascending order
%          desind - another index vector in descending order


L = length(vec);
ascind = 1:L; % create index vector for ascend order
desind = 1:L; % create index vector for descend order
for i = 1:L-1
    indlow = i; % initialize index for lowest
    indhigh = i; % initialize index for highest
    for j = (i+1):L
        %compare values in the original vector using vector of index
        if vec(ascind(j)) < vec(ascind(indlow))  ;
            indlow = j; % find lower index
        end
        if vec(desind(j)) < vec(desind(indhigh))
            indhigh = j; % find higher index 
        end
    end
    % exchange elements in the index vector of ascend order
    temp = ascind(i);
    ascind(i) = ascind(indlow);
    ascind(indlow) = temp;
    % exchange elements in the index vector of ascend order
    temp2 = desind(i);
    desind(i) = desind(indhigh);
    desind(indhigh) = temp2;
end






end

