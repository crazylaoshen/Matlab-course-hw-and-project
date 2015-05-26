function M = numbers(n, r, varargin  )
%Numbers create matrix with specified elements and size
% Input: n - elements of the matrix
%        r - number of rows
%       optional - number of column
% Returns: M - matrix in which every elment is n and size of r

if nargin == 2
    M = n*ones(r);
elseif nargin == 3
    c = varargin{1};
    M = n*ones(r,c);
else
    disp('You could only input 2 or 3 input as argument')




end

