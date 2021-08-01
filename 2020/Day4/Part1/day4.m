tic;
clear
clc
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

[A] = textscan(fid, '%s', 'Delimiter', '\n \n');

birthYear = ['b','y','r'];
issueYear = ['i','y','r'];
expirationYear = ['e','y','r'];
height = ['h','g','t'];
hairColor = ['h','c','l'];
eyeColor = ['e','c','l'];
passportID = ['p','i','d'];

birth = 0;
issue = 0;
expiration = 0;
hite = 0;
hair = 0;
eye = 0;
passport = 0;

validCounter = 0;
passportInfo = char(zeros(2418,3));
currentPassport = 1;
%pulls out data into passportInfo
for i = 1:2418
   if  isempty(A{1,1}{i,1}) == 1
       i = i + 1;
   end
   for j = 1:3
   passportInfo(i,j) = A{1,1}{i,1}(j);
   end
end

j = 1;
for i = 1:length(passportInfo) + 1
    if  i == length(passportInfo) + 1 || isempty(A{1,1}{i,1}) == 1
        i = i + 1;
        currentPassport = currentPassport + 1;
        if birth + issue + expiration + hite + hair + eye + passport == 7
            validCounter = validCounter + 1;
        end
        birth = 0;
        issue = 0;
        expiration = 0;
        hite = 0;
        hair = 0;
        eye = 0;
        passport = 0;
        if  i == length(passportInfo) + 2
            break;
        end
    end
     %checks to see if each letter is equal to the feild letter
    if passportInfo(i,j) == birthYear(j) && passportInfo(i, j +1) ==  birthYear(j + 1) && passportInfo(i, j + 2) ==  birthYear(j + 2)
        birth = 1;
        
    elseif passportInfo(i,j) == issueYear(j) && passportInfo(i, j +1) ==  issueYear(j + 1) && passportInfo(i, j + 2) ==  issueYear(j + 2)
        issue = 1;
        
    elseif passportInfo(i,j) == expirationYear(j) && passportInfo(i, j + 1) ==  expirationYear(j + 1) && passportInfo(i, j + 2) ==  expirationYear(j + 2)
        expiration = 1;
    
    elseif passportInfo(i,j) == height(j) && passportInfo(i, j +1) ==  height(j + 1) && passportInfo(i, j + 2) ==  height(j + 2)
        hite = 1;
    
    elseif passportInfo(i,j) == hairColor(j) && passportInfo(i, j +1) ==  hairColor(j + 1) && passportInfo(i, j + 2) ==  hairColor(j + 2)
        hair = 1;
    
    elseif passportInfo(i,j) == eyeColor(j) && passportInfo(i, j +1) ==  eyeColor(j + 1) && passportInfo(i, j + 2) ==  eyeColor(j + 2)
        eye = 1;
    
    elseif passportInfo(i,j) == passportID(j) && passportInfo(i, j +1) ==  passportID(j + 1) && passportInfo(i, j + 2) ==  passportID(j + 2)
        passport = 1;
    end

end
fprintf('The number of valid passports is: %d\n', validCounter);
fclose(fid);
toc;
