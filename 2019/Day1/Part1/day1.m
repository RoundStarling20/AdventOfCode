tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

Total = fscanf(fid, '%d', [1,inf]);

Total = sum(floor(Total ./3) - 2);

disp(Total);
fclose(fid);
toc
