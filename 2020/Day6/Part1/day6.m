tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

[A] = textscan(fid, '%s', 'Delimiter', '\n \n');
letters = zeros(length(A{1,1}),27);

group = 1;
for i = 1:length(A{1,1})
    if  isempty(A{1,1}{i,1}) == 1
        i = i + 1;
        group = group + 1;
    end
    for j = 1:length(A{1,1}{i,1})
        letters(group,mod(A{1,1}{i,1}(j), 123) - 96) = 1;
    end
    
end
total = sum(letters);
disp(sum(total));
fclose(fid);
toc
