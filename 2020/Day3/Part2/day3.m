tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

A = fscanf(fid,'%s',[31, 323]);
A = A';

currentrow = 1;
treecount = 0;
fprintf('Number of trees hit via different paths\n');
% down 1 right 1
while currentrow < 323
    for currentcollumn = 2:1:100000
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
first = treecount;
fprintf('Down 1 Right 1: %d \n', first);

%right 3 down 1
currentrow = 1;
treecount = 0;
while currentrow < 323
    for currentcollumn = 4:3:100000
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
fprintf('Down 1 Right 3: %d \n', second);

%right 5 down 1
currentrow = 1;
treecount = 0;
while currentrow < 323
    for currentcollumn = 6:5:100000
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
third = treecount;
fprintf('Down 1 Right 5: %d \n', third);

%right 7 down 1
currentrow = 1;
treecount = 0;
while currentrow < 323
    for currentcollumn = 8:7:100000
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
fourth = treecount;
fprintf('Down 1 Right 7: %d \n', fourth);

%right 1 down 2
currentcollumn = 1;
treecount = 0;
for currentrow = 3:2:323
    currentcollumn = currentcollumn + 1;
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
fifth = treecount;
fprintf('Down 2 Right 1: %d \n', fifth);

treecount = first * second * third * fourth * fifth;
fprintf('Product of all the trees hit: %d\n\n',treecount);
fclose(fid);
toc;
