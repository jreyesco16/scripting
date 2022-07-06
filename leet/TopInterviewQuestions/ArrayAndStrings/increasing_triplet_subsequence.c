// Author: Jesse Reyes Cortes
// Date : 07/05/2022
// Name: Increasing Triplet Subsequence
//
// Description: Given an integer array nums, return true if there exists a
// triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k].
// If no such indices exists, return false

// Example 1
// Input: nums = [1,2,3,4,5]
// Output: true
// Explanation: Any triplet where i < j < k is valid.

// Example 2
// Input: nums = [5,4,3,2,1]
// Output: false
// Explanation: No triplet exists.

// Example 3
// Input: nums = [2,1,5,0,4,6]
// Output: true
// Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

bool increasingTripletSubsequence(int *nums, int numsSize)
{
    bool output = false;

    if (numsSize < 3)
    {
        return output;
    }

    int firstMin = INT_MAX;
    int secondMin = INT_MAX;

    for (int i = 0; i < numsSize; i++)
    {
        if (nums[i] < firstMin)
        {
            firstMin = nums[i];
        }

        if (nums[i] > firstMin)
        {
            secondMin = nums[i] < secondMin ? nums[i] : secondMin;
        }

        if (nums[i] > secondMin)
        {
            return true;
        }
    }

    return output;
}

int main(int argc, char *argv[])
{

    int numsSize = 5;
    int *nums = (int *)malloc(numsSize * sizeof(int));
    memcpy(nums, (int[]){1, 2, 3, 4, 5}, numsSize * sizeof(int));

    bool expected = true;

    bool result = increasingTripletSubsequence(nums, numsSize);

    if (expected == result)
    {
        printf("PASSED\n");
    }
    else
    {
        printf("FAILED\n");
    }
}