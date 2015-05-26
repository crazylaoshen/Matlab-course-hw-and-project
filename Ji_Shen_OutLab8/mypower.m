function p = mypower( a, n )
%function mypower returns value of a of power n
% Inputs: a - base
%         n - power
% Return: p - a of power n

if n == 0
    p = 1;
elseif n > 0
    p = a * mypower(a, n-1);
end

end

