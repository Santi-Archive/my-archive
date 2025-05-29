while True:
    try:
        num1, num2 = input().split()
        if int(num2) <= 0:
            exit()
        else:
            break
    except ValueError:
        exit()

list1 = list(map(int, input().split()))
for n in list1:
    if int(n) > int(num1):
        exit()
    else:
        break

listset = set(list1)
if len(listset) != len(list1):
    exit()

if int(len(list1)) != int(num2):
    exit()
else:
    list2 = list(range(1, int(num1) + 1))
    difference = list(set(list2) - set(list1))
    difference.sort()
    for number in difference:
        print(number)