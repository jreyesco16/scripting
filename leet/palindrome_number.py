class Solution:
    def isPalindrome(self, x: int) -> bool:
        x_string = str(x)

        length = len(x_string)

        # automatically rounds off the .5
        pivot = int(length/2)

        for i in range(0, pivot):
            if x_string[i] != x_string[length-i-1]:
                return False

        return True


def main():
    solution = Solution()

    test_case = -121
    expected = False

    output = solution.isPalindrome(test_case)

    if expected == output:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
