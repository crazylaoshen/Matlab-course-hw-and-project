clear; clc; 
fid = fopen('bieber.txt');  
if fid == -1
    disp('File open not successful')
else
   
  
        % Read one line into a String variable
        aLine = fgetl(fid);
        %tokenize that line based on the format & delimiter
        tokens = textscan(aLine, '%s %f %s %f %s %*s %*s %*s %s');
        %concatenate the new line
        
        
        [score,words] = xlsread('sentiments.xlsx');
   
    closeresult = fclose(fid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end