num1, num2 = input().split()
list1 = list(map(int, input().split()))
list2 = list(range(1, int(num1) + 1))
difference = list(set(list2) - set(list1))
difference.sort()
for number in difference:
    print(number)