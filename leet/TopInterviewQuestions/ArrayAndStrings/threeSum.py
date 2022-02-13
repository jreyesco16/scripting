def threeSum(nums):
        
        threes = []
        
        nums.sort()
        
        i = 0
        stop = len(nums) - 2
        
        while(i < stop):

            j = i + 1
            k = len(nums) -1
            
            while(j < k):
                sum = nums[i] + nums[j] + nums[k]

                if(sum == 0):
                    if( i != j and i != k and j != k):
                        threes.append([nums[i], nums[j], nums[k]])
                    j += 1
                    k -= 1
                    #skip duplicates
                    while(nums[k] == nums[k+1] and k > 0):
                        k -=1
                    # skip duplicates
                    while(nums[j] == nums[j-1] and j < len(nums)-1):
                        j += 1
                elif(sum < 0):
                    j+=1
                elif(sum > 0):
                    k-=1
            
            i+=1
            
            # skip past duplicates
            while(nums[i] == nums[i-1] and i < len(nums) -1):
                i+=1
        
        return threes


def main():

    testCase = [-1,0,1,2,-1,-4,-2,-3,3,0,4]
    expectedResult = [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]
    threes = threeSum(testCase)

    print("OUTPUT",threes)
    print("EXPECTED", expectedResult)


    if (threes == expectedResult):
        print("PASSING")
    else:
        print("FAILING")

if __name__ == "__main__":
    main()