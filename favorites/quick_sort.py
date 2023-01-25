from typing import List

def QuickSort(nums: List[int]) -> List[int]:

    

    return nums

def main():

    nums = [2, 29, 42, 298, 223, 2, 43, 492, 23, 94, 10, 2232, 223, 902, 23, 43]

    sorted_nums = QuickSort(nums)

    if nums.sort() == sorted_nums:
        print("PASSED")
    else:
        print("FAILED")

if __name__=="__main__":
    main()
