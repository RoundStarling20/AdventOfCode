tic;
%checks to see if file exists
[fid,msg] = fopen("input.txt" , 'rt');
error(msg)

A = fscanf(fid,'%d',[1, inf]);


sum = 0;
multiply = 0;

for k = 1:length(A)
    for i = 2:length(A)
        sum = A(i) + A(k);
        if sum == 2020
            multiply = A(k) * A(i);
            break
        end
    end
end


disp(multiply);
fclose(fid);
toc
