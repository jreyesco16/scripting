from typing import List
import random

def Swap(nums: List[int], l: int, r: int):
    tmp = nums[l]
    nums[l] = nums[r]
    nums[r] = tmp

def QuickSort(nums: List[int], l: int, r: int):
    # base case
    if r <= l:
        return

    oL, oR = l, r
    
    p = r # pivot: nums[p]
    r = p-1 


    while l < r:
        while nums[l] < nums[p] and l < r:
            l+=1
    
        while nums[p] < nums[r] and l < r:
            r-=1

        Swap(nums, l, r)
        if l < r:
            l+=1
            r-=1

    # edge case: if pivot is larger than right pointer than move right up by one
    if nums[r] < nums[p]:
        r+=1

    Swap(nums, r, p)

    QuickSort(nums, oL, r-1) # left partition
    QuickSort(nums, r+1, oR) # right partition


def main():
    nums = random.sample(range(-100, 100), 100)

    sorted_nums = QuickSort(nums, 0, len(nums)-1)

    if nums.sort() != sorted_nums:
        print("FAILED")
        return

if __name__=="__main__":
    for i in range(100):
        main()

    print("PASSED")