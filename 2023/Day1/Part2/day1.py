numbers = {"one" : "1", 
           "two" : "2", 
           "three" : "3",
            "four" : "4",
            "five" : "5",
             "six" : "6", 
             "seven" : "7", 
             "eight" : "8", 
             "nine" : "9"}

def num2int(string:str) ->str:
    calibration = ''
    j = 0
    for i in range(len(string)):
        if string[i].isdigit():
            calibration = calibration + string[i]
            j = i + 1
        else:
            substring = string[j:i+1]
            for key in numbers.keys():
                if key in substring:
                    j = i - 1 #account for overlap twoone = 21
                    substring = numbers[key]
                    calibration = calibration + substring
                    break
    return calibration

with open('input.txt', 'r') as file:
    count = 0
    Lines = file.readlines()
    for line in Lines:
        string = num2int(line)
        count += int(string[0] + string[-1])
    print(count)