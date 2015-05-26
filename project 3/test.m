%%
clear; clc; 
fid = fopen('bieber.txt');  
if fid == -1
    disp('File open not successful')
else
   
  
        % Read one line into a String variable
        aLine = fgetl(fid);        
        %tokenize that line based on the format & delimiter
        tokens = textscan(aLine, '%s');
        %concatenate the new line
        tokens = lower(tokens{:});
        geo = [tokens{1},tokens{2},tokens{3},tokens{4},tokens{5}];
        [score,words] = xlsread('sentiments.xlsx');
        lia = ismember(tokens,words);
        w = tokens(lia);
        s = zeros(1,length(w));
        for i = 1:length(w)
        index = find(strcmp(words, w(i)));
        s(i) = score(index);
        end
        stotal = sum(s);
   
    closeresult = fclose(fid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end
