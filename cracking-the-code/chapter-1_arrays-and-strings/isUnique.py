#   Date: 12-28-2021
#
#   1.1 Is Unique : implement an algorithm to determine if a string has all unique characters.

#   Q: What if you cannot use additional data structure?
#   A: Then we have to check every character with every other one, there it would take O(N^2)

def isUnique(string: str) -> bool:

    temp: [str] = []

    for i in range(len(string)):
        if(string[i] in temp):
            return False
        else:
            temp.append(string[i])

    return True


if __name__=="__main__":
    cases: [str] = ['adafdadf', 'asdgekrl', 'q34qwer']

    results: [bool] = [False, True, False] 

    for i in range(len(cases)):
        print("PASSED" if isUnique(cases[i]) == results[i] else "FAILED")


