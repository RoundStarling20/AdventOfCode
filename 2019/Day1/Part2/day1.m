tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

A = fscanf(fid, '%d', [1,inf]);

fuel = floor(A ./3) - 2;
total = sum(fuel);

for i = 1:length(fuel)
    if (floor(fuel(i) /3) - 2 <= 0)
        fuel(i) = 0;
    else
        while fuel(i) > 0
            fuel(i) = floor(fuel(i) /3) - 2;
            if fuel(i) > 0
                total = fuel(i) + total;
            end
        end
    end
end
disp(total);
fclose(fid);
toc
