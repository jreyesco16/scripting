##  Increasing Triplet Subsequence
##
##  Given an integer array nums, return true if there exists 
##  a triple of INDICES (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. 
##  If no such INDICES exists, return false.

class Solution:
    def increasingTriplet(self, nums: list[int]) -> bool:
        minTmp = 100*100
        medTmp = 100*100
        # max = 0

        for i in range(len(nums)):
         
            if (nums[i] < minTmp):
                minTmp = nums[i]
            elif (minTmp < nums[i] and nums[i] < medTmp):
                medTmp = nums[i]
            else:
                return True

            print("New Iteration - minTmp: {0}\tmedTmp: {1}\tcurrValue: {2}".format(minTmp, medTmp, nums[i]))
        
        return False
        


def main():
    input = [0,4,2,1,0,-1,-3]

    output = False

    solution = Solution()

    result = solution.increasingTriplet(input)

    if(result==output):
        print("PASSED")
    else:
        print("FAILED")


if __name__=="__main__":
    main()