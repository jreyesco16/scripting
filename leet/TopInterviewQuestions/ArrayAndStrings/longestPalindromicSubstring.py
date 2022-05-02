##  Longest Palindromic Substring
##
##  Description: Given a string s, return the longest palindromic substring in s
## 
##  Input: s = "babad"
##  Output: "bab"
##  Explanation: "aba" is also a valid answer.

class Solution:
    def longestPalindrome(self, s: str) -> str:
        
        # do magic here
        
        return s


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