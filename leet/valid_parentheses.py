class Solution:
    def isValid(self, s: str) -> bool:
        pivot = int(len(s)/2)

        for i in range(0, pivot):
            s = s.replace('()', '')
            s = s.replace('{}', '')
            s = s.replace('[]', '')

            if s == '':
                return True

        return False


def main():
    test_case = "(([]){})"
    expected = True

    solution = Solution()

    result = solution.isValid(test_case)

    if expected == result:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
