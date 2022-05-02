##  Longest Palindromic Substring
##
##  Description: Given a string s, return the longest palindromic substring in s
##  
##  NOT MY SOLUTION! THANK YOU NeetCode (plz subscribe to him) : 
##  https://www.youtube.com/watch?v=XYQecbcd6_c

class Solution:
    def longestPalindrome(self, s: str) -> str:
        res = ""
        resLen = 0

        # using i as a pivot
        for i in range(len(s)):
            # odd length
            l, r = i, i

            while l >= 0 and r < len(s) and s[l] == s[r]:
                if (r - l + 1) > resLen:
                    res = s[l:r+1]
                    resLen = r - l + 1
                l -= 1
                r += 1
            # even length
            l, r = i, i + 1
            while l >= 0 and r < len(s) and s[l] == s[r]:
                if (r - l + 1) > resLen:
                    res = s[l:r+1]
                    resLen = r - l + 1
                l -= 1
                r += 1
            
        return res


def main():
    solution = Solution()

    input = "babad"
    output = "bab"

    result = solution.longestPalindrome(input)

    print("Result: ", result)

    if(result == output):
        print("PASSED\n")
    else:
        print("FAILED\n")    




if __name__=="__main__":
    main()