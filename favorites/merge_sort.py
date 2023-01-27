from typing import List
import random

def Swap(nums: List[int], l: int, r: int):
    tmp = nums[l]
    nums[l] = nums[r]
    nums[r] = tmp

def MergeSort(nums: List[int], l: int, r: int):

    if r-l==0:
        return
    elif r-l==1:
        if nums[r] < nums[l]:
            Swap(nums, l, r)
        return

    p = r-l // 2

    MergeSort(nums, l, p)
    MergeSort(nums, p+1, r)


def main():
    nums = random.sample(range(-100, 100), 100)

    sorted_nums = MergeSort(nums, 0, len(nums)-1)

    if nums.sort() != sorted_nums:
        print("FAILED")
        return

if __name__=="__main__":
    for i in range(100):
        main()

    print("PASSED")