##  Increasing Triplet Subsequence
##
##  Given an integer array nums, return true if there exists 
##  a triple of INDICES (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. 
##  If no such INDICES exists, return false.

class Solution:
    def increasingTriplet(self, nums: list[int]) -> bool:
        n = len(nums)

        if (n < 3):
            return False


        for i in range(len(nums)-2):
            print("New iteration starting with nums[i]: ", nums[i])
            count = 0

            # create pivots
            j = i+1
            k = n-1

            print("j: ", j)
            print("k: ", k)

            while(j < k):

                print("Curent values: nums[i]: {0} nums[j]: {1} nums[k]: {2}".format(nums[i], nums[j], nums[k]))

                # condition is met
                if(nums[i] < nums[j] and nums[j] < nums[k]):
                    return True
                # j < i
                elif(nums[j] < nums[i]):
                    j += 1
                # j < i and j < k
                elif(nums[k] < nums[i]):
                    k -= 1
                else:
                    j += 1

        return False
        


def main():

    input = [1,6,2,5,1]

    output = True

    solution = Solution()

    result = solution.increasingTriplet(input)

    if(result==output):
        print("PASSED")
    else:
        print("FAILED")


if __name__=="__main__":
    main()