with open('input.txt', 'r') as file:
    count = 0
    Lines = file.readlines()
    for line in Lines:
        string = ''.join(filter(str.isdigit, line)) #if str subset is an int, add to empty string
        count += int(string[0] + string[-1])
    print(count)
