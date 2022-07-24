class Solution:
    def containsDuplicate(self, nums: list[int]) -> bool:

        s = set(nums)

        if len(nums) == len(s):
            return False

        return True


def main():
    test_case = [1, 2, 3, 1]
    expected = True

    solution = Solution()

    result = solution.containsDuplicate(test_case)

    if expected == result:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
