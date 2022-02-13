# Author: Jesse Reyes Cortes
# Date : 08/07/2021
# Name: groupAnagrams
# Description: given array of strings 'strs', group the anagrams (words spelled with same chars) together

import copy

def group_anagrams(strs):
    res = []

    dic = {}
    
    for i in strs:
        ana_sorted = "".join(sorted(i))

        if ana_sorted in dic:
            dic[ana_sorted].append(i)
        else:
            dic[ana_sorted] = []
            dic[ana_sorted].append(i)

    for i in dic:
        res.append(dic[i])
    
    return res


def main():
    testCase = ["eat","tea","tan","ate","nat","bat"]
    expectedResult = [["bat"],["nat","tan"],["ate","eat","tea"]]
    result = group_anagrams(testCase)

    print("OUTPUT",result)
    print("EXPECTED", expectedResult)

    if(expectedResult == result):
        print("PASSED")
    else:
        print("FAILED")



if __name__=="__main__":
    main()