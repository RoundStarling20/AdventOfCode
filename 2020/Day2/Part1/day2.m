tic;
clc
clear
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)
[A] = textscan(fid, '%d-%d %s', 'Delimiter', '\n');
A= A';

sum = 0;
multiply = 0;
min = 0;
max = 0;
minicount = 0;
bigcount = 0;
for i = 1:1000
    min = A{1,1}(i);
    max = A{2,1}(i);
    charToLook = A{3,1}{i,1}(1);
    minicount = 0;
    for j = 3:length(A{3,1}{i,1})
        if A{3,1}{i,1}(j) == charToLook
            minicount = minicount + 1;
        end
    end
    if (minicount >= min) && (minicount <= max)
        bigcount = bigcount + 1;
    end
end

fprintf('Total passwords that meet requrements = %d\n', bigcount);
fclose(fid);
toc
