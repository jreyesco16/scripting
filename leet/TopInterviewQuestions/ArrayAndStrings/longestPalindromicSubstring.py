##  Longest Palindromic Substring
##
##  Description: Given a string s, return the longest palindromic substring in s
##  
##  Stack Overflow citation : 
##  https://stackoverflow.com/questions/22469997/how-to-get-all-the-contiguous-substrings-of-a-string-in-python

class Solution:
    def sortListByLength(self, list):
        return sorted(list, key=len, reverse=True)

    def get_all_substrings(self, s: str):
        length = len(s)

        return [s[i:j + 1] for i in range(length) for j in range(i,length)]

    def isPalindrome(self, s: str) -> bool:

        if (len(s) <= 1):
            return True
        
        # below ''.join(reversed(s)) will reverse s string
        if (s == ''.join(reversed(s))):
            return True

        return False

    def longestPalindrome(self, s: str) -> str:
        list = self.get_all_substrings(s)

        sortedList = self.sortListByLength(list)

        for l in sortedList:
            if(self.isPalindrome(l)):
                return l     

        return ""


def main():
    solution = Solution()

    input = "babad"
    output = "bab"

    result = solution.longestPalindrome(input)

    if(result == output):
        print("PASSED\n")
    else:
        print("FAILED\n")    




if __name__=="__main__":
    main()