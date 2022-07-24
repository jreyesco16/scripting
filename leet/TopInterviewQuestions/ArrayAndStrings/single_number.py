class Solution:
    def singleNumber(self, nums: list[int]) -> int:

        res = 0

        for x in nums:
            # xor bit manipulation
            res = x ^ res

        return res


def main():
    test_case = [2, 2, 1]
    expected = 1

    solution = Solution()

    result = solution.singleNumber(test_case)

    if expected == result:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
