# Author: Jesse Reyes Cortes
# Date : 07/05/2022
# Name: Count And Say
#
# Description: The count-and-say sequence is a sequence of digit strings defined by the recursive formula
#          * countAndSay(1) = "1"
#          * countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1),
#            which is then converted into a different digit string.

class Solution:
    def __init__(self):
        self.mem = {}

    def decode(self, n: int) -> str:
        prev_str = self.mem[n-1]

        count = 1
        prev_char = prev_str[0]

        current_str = ""

        for i in range(1, len(prev_str)+1):
            if i == len(prev_str):
                return current_str+str(count)+prev_char

            current_char = prev_str[i]

            if current_char == prev_char:
                count += 1
            else:
                current_str = current_str+str(count)+prev_char
                prev_char = current_char
                count = 1

        return current_str

    def countAndSay(self, n: int) -> str:
        for i in range(1, n+1):
            if i == 1:
                self.mem[i] = "1"
            else:
                self.mem[i] = self.decode(i)

        return self.mem[n]


def main():
    test_case = 5
    solution = Solution()
    output = solution.countAndSay(test_case)

    expected = "111221"

    if output == expected:
        print("Passed")
    else:
        print("Failed", expected)


if __name__ == "__main__":
    main()
