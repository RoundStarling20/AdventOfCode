tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

[A] = textscan(fid, '%s', 'Delimiter', '\n \n');
letters = zeros(length(A{1,1}),27);

for i = 1:length(A{1,1})
    people(1,i) = ~isempty(A{1,1}{i,1});
end

peopleInGroup = zeros(1,1000);
j = 1;
for i = 1:length(people)
   if people(i) == 1
       peopleInGroup(j) = peopleInGroup(j) + 1;
   end
   if people(i) == 0
       j = j + 1;
   end
end
group = 1;

for i = 1:length(A{1,1})
    if  isempty(A{1,1}{i,1}) == 1
        group = group + 1;
    else
        for j = 1:length(A{1,1}{i,1})
        letters(group,mod(A{1,1}{i,1}(j), 123) - 96) = letters(group,mod(A{1,1}{i,1}(j), 123) - 96) + 1;
        end
    end
end

[height,lengthOf] = size(letters);
total = 0;
for i = 1:group
    for j = 1:lengthOf
        if letters(i,j) == peopleInGroup(i)
            total = total + 1;
        end
    end
end
disp(total);
fclose(fid);
toc
