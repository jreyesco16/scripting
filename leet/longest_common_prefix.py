class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:

        prefix = ""

        m = [list(row) for row in strs]

        for i in range(0, len(m[0])):
            try:
                letters = [col[i] for col in m]

                letters_set = set(letters)

                if len(letters_set) > 1:
                    break

                prefix += letters_set.pop()
            except IndexError:
                break

        return prefix


def main():
    test_case = ["flower", "flow", "flight"]
    expected = "fl"

    solution = Solution()

    result = solution.longestCommonPrefix(test_case)

    if expected == result:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
