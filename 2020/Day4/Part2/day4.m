tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

%read in file, seperate by double newline
[A] = textscan(fid, '%s', 'Delimiter', '\n \n');

birthYear = ['byr'];
issueYear = ['iyr'];
expirationYear = ['eyr'];
height = ['hgt'];
hairColor = ['hcl'];
eyeColor = ['ecl'];
passportID = ['pid'];

birthPresent = 0;
issuePresent = 0;
expirationPresent = 0;
hightPresent = 0;
hairPresent = 0;
eyePresent = 0;
passportPresent = 0;

validCounter = 0;

currentPassport = 1;
%pulls out data into passportInfo
i = 1;
while i <= length(A{1,1})
    if  isempty(A{1,1}{i,1}) == 1
        i = i + 1;
    end
    A{1,1}{i,1} = strsplit(A{1,1}{i,1}, ':');
    i = i + 1;
end

j = 1;
for i = 1:length(A{1,1}) + 1
    if  i == length(A{1,1}) + 1 || isempty(A{1,1}{i,1}) == 1
        i = i + 1;
        currentPassport = currentPassport + 1;
        if birthPresent + issuePresent + expirationPresent + ...
                hightPresent + hairPresent + eyePresent...
                + passportPresent == 7 %are all feilds present
            validCounter = validCounter + 1;
        end
        % reset counters
        birthPresent = 0;
        issuePresent = 0;
        expirationPresent = 0;
        hightPresent = 0;
        hairPresent = 0;
        eyePresent = 0;
        passportPresent = 0;
        if  i == length(A{1,1}) + 2 %accounts for last value
            break;
        end
    end
    if A{1,1}{i,1}{1,1} == birthYear
        % must be 4 digits, at least 1920 and at most 2002
        if length(A{1,1}{i,1}{1,2}) >= 4 &&...
                str2num(A{1,1}{i,1}{1,2}) >= 1920 &&...
                str2num(A{1,1}{i,1}{1,2}) <= 2002
            birthPresent = 1;
        end
        
    elseif A{1,1}{i,1}{1,1} == issueYear
        % must be four digits, at least 2010 and at most 2020
        if length(A{1,1}{i,1}{1,2}) >= 4 &&...
                str2num(A{1,1}{i,1}{1,2}) >= 2010 &&...
                str2num(A{1,1}{i,1}{1,2}) <= 2020
            issuePresent = 1;
        end
        
    elseif A{1,1}{i,1}{1,1} == expirationYear
        % four digits, at least 2020 and at most 2030
        if length(A{1,1}{i,1}{1,2}) >= 4 &&...
           str2num(A{1,1}{i,1}{1,2}) >= 2020 &&...
           str2num(A{1,1}{i,1}{1,2}) <= 2030
            expirationPresent = 1;
        end
        
    elseif A{1,1}{i,1}{1,1} == height
        % a number followed by cm or in
            % if cm - number must be at least 150 and at most 193
            % if in - number must be at least 59 and at most 193
        if A{1,1}{i,1}{1,2}(end - 1) == 'c'
            if str2num(A{1,1}{i,1}{1,2}(1:end - 2)) >= 150 &&...
                    str2num(A{1,1}{i,1}{1,2}(1:end - 2)) <= 193
                hightPresent = 1;
            end
            
        elseif A{1,1}{i,1}{1,2}(end - 1) == 'i'
            if str2num(A{1,1}{i,1}{1,2}(1:end - 2)) >= 59 &&...
                    str2num(A{1,1}{i,1}{1,2}(1:end - 2)) <= 76
                hightPresent = 1;
            end
        end
        
    elseif A{1,1}{i,1}{1,1} == hairColor
        % a # followed by exactly 6 char 0-9 or a-f
        if A{1,1}{i,1}{1,2}(1) == '#' &&...
                length(A{1,1}{i,1}{1,2}(2:end)) == 6 &&...
                sum(A{1,1}{i,1}{1,2}(2:end) <= 102) == 6 &&...
                sum(A{1,1}{i,1}{1,2}(2:end) >= 48) == 6
            hairPresent = 1;
        end
        
    elseif A{1,1}{i,1}{1,1} == eyeColor
        % excactly one of: amb, blu, brn, gry, grn, hzl, oth
        if length(A{1,1}{i,1}{1,2}) == 3
            if sum(A{1,1}{i,1}{1,2} == 'amb') == 3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'blu') == 3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'brn') ==3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'gry') == 3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'grn') ==3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'hzl') == 3 ||...
                    sum(A{1,1}{i,1}{1,2} == 'oth') == 3
                eyePresent = 1;
            end
        end
        
    elseif A{1,1}{i,1}{1,1} == passportID
        % a nin digit number including leading zeros
        if sum(A{1,1}{i,1}{1,2} >= 48) == 9 &&...
                sum(A{1,1}{i,1}{1,2} <= 57) == 9 &&...
                length(A{1,1}{i,1}{1,2}) == 9
            passportPresent = 1;
        end
    end
end
fprintf('The number of valid passports is: %d\n', validCounter);
fclose(fid);
toc;
