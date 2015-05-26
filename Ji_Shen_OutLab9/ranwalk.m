


function walkmat = ranwalk(n)
walkmat = ones(n);
x = floor(n/2);
y = floor(n/2);
color = 2;
walkmat(x,y) = color;
while x ~= 1 && x ~= n && y ~= 1 && y ~= n
    x = x + randi([-1 1]);
    y = y + randi([-1 1]);
    color = color + 1;
    walkmat(x,y) = mod(color,65);
end
