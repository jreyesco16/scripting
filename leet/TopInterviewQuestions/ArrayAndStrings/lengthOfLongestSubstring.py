
# Author: Jesse Reyes Cortes
# Date : 08/15/2021
# Name: Longest Substring Without Repeating Characters
# Description: given a string "s", find the length of the longest substring without repeating characters

def lengthOfLongestSubstring(case):

    length_max = 0
    
    sub_string = ""

    chars_list = list(case)
        
    if(len(chars_list) != 0):
        length_max = 1

    while (len(chars_list) > 0):
        sub_string=chars_list.pop(0)
        for i in chars_list:
            if sub_string.__contains__(i):
                sub_string=i
                break
            else:
                sub_string+=i
                length_max = max(length_max, len(sub_string))
                
    return length_max


def main():
    test = " "
    expected = 1
    result = lengthOfLongestSubstring(test)

    print("OUTPUT",result)
    print("EXPECTED", expected)


    if (expected == result):
        print("PASSED")
    else:
        print("FAILED")



if __name__ == "__main__":
    main()