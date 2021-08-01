tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

A = textscan(fid, '%s', 'Delimiter', '\n');
row = zeros(length(A{1,1}),1);
collumns = zeros(length(A{1,1}),1);
currentMax = 0;

seatID = zeros(length(A{1,1}),1);
for i = 1:length(A{1,1})
    rowRange = [0,127];
    collumn = [0,7];
    for j = 1:length(A{1,1}{i,1}) - 3
        if A{1,1}{i,1}(j) == 'F'
            rowRange(2) = floor((rowRange(1) + ((rowRange(2) - rowRange(1)) /2)));
            if j == length(A{1,1}{i,1}) - 3
                row(i,1) = rowRange(1);
            end
        elseif A{1,1}{i,1}(j) == 'B';
            rowRange(1) = ceil(((rowRange(2) - rowRange(1)) / 2) + rowRange(1));
            if j == length(A{1,1}{i,1}) - 3
                row(i,1) = rowRange(2);
            end
        end
    end
    
    for j = (length(A{1,1}{i,1}) - 2):length(A{1,1}{i,1})
        if A{1,1}{i,1}(j) == 'L'
            collumn(2) = floor((collumn(1) + ((collumn(2) - collumn(1)) /2)));
            if j == length(A{1,1}{i,1})
                collumns(i,1) = collumn(1);
            end
        elseif A{1,1}{i,1}(j) == 'R';
            collumn(1) = ceil(((collumn(2) - collumn(1)) / 2) + collumn(1));
            if j == length(A{1,1}{i,1})
                collumns(i,1) = collumn(2);
            end
        end
    end
    seatID(i,1) = (row(i,1) * 8) + collumns(i,1);
end
disp(max(seatID));

%sort funtion
for j = 1:length(seatID)
    for i = 1:length(seatID) - 1
        larger = 0;
        if seatID(i) > seatID(i + 1)
            larger = seatID(i);
            seatID(i) = seatID(i + 1);
            seatID(i + 1) = larger;
        end
    end
end

j = min(seatID);
missing = 0;
for i = 1:length(seatID)
    if seatID(i,1) ~= j
        missing = j;
        break
    end
    j = j + 1;
    
end
disp(missing);
toc
