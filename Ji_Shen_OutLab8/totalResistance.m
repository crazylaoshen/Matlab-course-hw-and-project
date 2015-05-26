function R = totalResistance( varargin )
%totalResistance return the equivalent electrical resistance of the
%resistor network
%Input: individual resistantce
%Return: R - equivalent resistance

k = zeros(1,nargin);
for i = 1:nargin
    k(i) = 1/varargin{i};
end
R = 1/sum(k);
    


end

