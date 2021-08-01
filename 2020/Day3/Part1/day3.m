tic;
clear
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

A = fscanf(fid,'%s',[31, 323]);
A = A';

%right 3 down 1
currentrow = 1;
currentcollumn = 1;
treecount = 0;
while currentrow < 323
    for currentcollumn = 4:3:1000000
        clc
        currentrow = currentrow + 1;
        if currentrow > 323
            break;
        end
        if currentcollumn > 31
            currentcollumn = mod(currentcollumn,31) ;
        end
        if currentcollumn == 0
            currentcollumn = 31;
        end
        if A(currentrow,currentcollumn) == '#'
            treecount = treecount + 1;
        end
    end
end
second = treecount;
disp(treecount);
fclose(fid);
toc;
