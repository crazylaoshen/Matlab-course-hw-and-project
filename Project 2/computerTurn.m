% Name Ji Shen
% Date 10/19/2014
% Lab Section #203
% Project 2:  Game of Stick


function [ remSticks, gameOver ] = computerTurn( numSticks )
%Simulate the turn of unintelligent computer, i.e. random picks
%Inputs:
%numSticks - the number of sticks on the board before computer's turn
%Returns:
%remSticks - the number of sticks on the board after the player's turn
%gameOver - false if game is not over, true if game is over
disp('Computer: How many sticks do you take(1-3)? ');
pause(0.5);
numToPick = randi(3);
if numToPick >numSticks
    numToPick = numSticks;
end
fprintf('Computer selects %d.\n',numToPick);
remSticks = numSticks - numToPick;
if remSticks>0
    gameOver = 0;
else 
    gameOver = 1;
    fprintf('Computer loses.\n')
end
gameOver = logical(gameOver);
end

