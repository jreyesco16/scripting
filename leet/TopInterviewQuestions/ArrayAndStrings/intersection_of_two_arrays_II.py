class Solution:
    def intersect(self, nums1: list[int], nums2: list[int]) -> list[int]:

        i = []

        for x in nums1:
            if x in nums2:
                i.append(x)

                nums2.remove(x)

        return i


def main():
    nums1 = [4, 9, 5]
    nums2 = [9, 4, 9, 8, 4]
    expected = [4, 9]

    solution = Solution()

    output = solution.intersect(nums1, nums2)

    if output == expected:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
