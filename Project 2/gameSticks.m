% Name Ji Shen
% Date 10/19/2014
% Lab Section #203
% Project 2:  Game of Stick

clc;clear;
disp('******************************');
disp('Welcome to the game of sticks');
disp('******************************');

nt = input('Number of sticks initially (10-100)? ');
while nt<10 || nt>100
    disp('Please enter a number between 10 and 100');
    nt = input('Number of sticks initially (10-100)? ');   
end

mode = menu('Game modes','Play against a friend','Play against a untelligent computer','Play & Train an AI','Play against a Trained AI');
switch mode;
    case 1
coin = 1;  % Initialize coin is true
% Use while loop to repeat game if player choose to play again
while coin == 1 
gameOver = false;   
while ~gameOver;
fprintf('There are %d sticks on the board.\n',nt);
% Call the function playerTurn for player 1's turn
 [ nt, gameOver ] = playerTurn( 'player 1', nt ); 
if ~gameOver  % if condition on gameOver is false
fprintf('There are %d sticks on the board.\n',nt);
% Call the function playerTurn for player 2's turn
 [ nt, gameOver ] = playerTurn( 'player 2', nt );
end
% Ask player whether play again.
coin = input('Do you want to play again?(1 = yes, 0 = no)');
while coin ~=1 && coin ~=0  % error checking the input of coin
    disp('You entered an invalid number!');
coin = input('Do you want to play again?(1 = yes, 0 = no)');
end
end
end

    case 2
coin = 1;
while coin == 1
gameOver = false;         
while ~gameOver 
fprintf('There are %d sticks on the board.\n',nt);
% Call the function playerTurn for player 1's turn
[ nt, gameOver ] = playerTurn( 'player 1', nt );
if ~gameOver
fprintf('There are %d sticks on the board.\n',nt);
% Call the function computerTurn for computer's turn
[ nt, gameOver ] = computerTurn( nt );
end
end
coin = input('Do you want to play again?(1 = yes, 0 = no)');
while coin ~=1 && coin ~=0
    disp('You entered an invalid number!');
coin = input('Do you want to play again?(1 = yes, 0 = no)');
end
end
  
case 3
coin = 1;
a = [1 2 3]'; % Creat vector for drawing numbers of sticks to pick
b = repmat(a, 1, nt); % Expand it to matrix with column number equal to stick number
c = mat2cell(b,3,ones(1,nt)); % Convert matrix to cell array
while coin == 1
winPick = zeros(1,nt); % Preallocate memory for ai's pick
left4P = nt;  % Hunman select first
gameOver = false;         
while ~gameOver
fprintf('There are %d sticks on the board.\n',left4P);
% Call the function playerTurn for player 1's turn
[ left4Ai, gameOver ] = playerTurn( 'player 1', left4P );
if ~gameOver
fprintf('There are %d sticks on the board.\n',left4Ai);
% Call the function aiTurn for AI's turn
[ left4P, gameOver ] = aiTurn( left4Ai,c );
% Index with number of sticks left for ai to pick(track the which hat)
k = left4Ai;  
% Record how many ai choose to pick(record the ball from that hat)
winPick(k) = left4Ai-left4P; 
else 
ind = find(winPick~=0); % get the index of record of the pick
 for i = 1:length(ind)  % add these winning picks to the hat 
c{ind(i)} = [c{ind(i)};winPick(ind(i))];
 end
end
end
coin = input('Do you want to play again?(1 = yes, 0 = no)');
while coin ~=1 && coin ~=0
    disp('You entered an invalid number!');
coin = input('Do you want to play again?(1 = yes, 0 = no)');
end
end

    case 4
disp('Training the AI. Please wait.');
a = [1 2 3]';
b = repmat(a, 1, nt);
c = mat2cell(b,3,ones(1,nt));

for i = 1:10000; % Training ai for 100000 times
winPick = zeros(1,nt);  % Preallocate memory for ai's pick
left4Ai2 = nt;
gameOver = false;         
while ~gameOver
[ left4Ai, gameOver ] = aiTurn( left4Ai2,c );
if ~gameOver   % if ai2 not lose
% ai continue picking sticks   
[ left4Ai2, gameOver ] = aiTurn( left4Ai,c );
% Index with number of sticks left for ai to pick
k = left4Ai;   
% Record how many ai choose to pick(record the ball from that hat)
winPick(k) = left4Ai-left4Ai2; 
% If player 1 loose then add the ai's picks to cell array(add the winning
% balls back the hat)
else
ind = find(winPick~=0);
 for j = 1:length(ind)   % add these winning picks to the hat 
c{ind(j)} = [c{ind(j)};winPick(ind(j))];
 end
end
end
end
% Same as case 2 from now on
coin = 1;
while coin == 1
left4P = nt;
gameOver = false;         
while ~gameOver
fprintf('There are %d sticks on the board.\n',left4P);
[ left4Ai, gameOver ] = playerTurn( 'player 1', left4P );
if ~gameOver
fprintf('There are %d sticks on the board.\n',left4Ai);
[ left4P, gameOver ] = aiTurn( left4Ai,c );
numToPick = left4Ai - left4P;
fprintf('AI selects %d.\n',numToPick);
if gameOver
    fprintf('AI loses.\n')
end
end
end
coin = input('Do you want to play again?(1 = yes, 0 = no)');
while coin ~=1 && coin ~=0
    disp('You entered an invalid number!');
coin = input('Do you want to play again?(1 = yes, 0 = no)');
end
end
end

