% Name Ji Shen
% Date 10/19/2014
% Lab Section #203
% Project 2:  Game of Stick

function [ remSticks, gameOver ] = playerTurn( player, numSticks )
%Simulate the turn of human player
%Inputs:
%Player - a string contains either 'Player 1' or 'Player 2'
%numSticks = the number of sticks on the board before the player's turn
%Returns:
%remSticks - the number of sticks on the board after the player's turn
%gameOver - false if game is not over, true if game is over


msg = sprintf('%s, How many sticks do you take(1-3)?', player);
numToPick = input(msg);
if numToPick >numSticks
    numToPick = numSticks;
end
while numToPick<1 || numToPick>3
    disp('Please enter a number between 1 and 3');
    numToPick = input(msg);
end
remSticks = numSticks - numToPick;
if remSticks>0
    gameOver = 0;
else 
    gameOver = 1;
     fprintf('%s loses.\n',player)
end
gameOver = logical(gameOver);
end

