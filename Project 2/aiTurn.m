function [ remSticks,gameOver ] = aiTurn( numSticks, M )
%Simulate the turn of unintelligent computer, i.e. random picks
%Inputs:
%numSticks - the number of sticks on the board before computer's turn
%Returns:
%remSticks - the number of sticks on the board after the player's turn
%gameOver - false if game is not over, true if game is over
numToPick = randsample(M{numSticks},1);
if numToPick >numSticks
    numToPick = numSticks;
end

remSticks = numSticks - numToPick;
if remSticks>0
    gameOver = 0;
else 
    gameOver = 1;
end
gameOver = logical(gameOver);
end

