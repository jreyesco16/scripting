# Author: Jesse Reyes Cortes
# Date : 07/20/2022
# Name: Best Time to Buy and Sell II
#
# You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
#
# On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
#
# Find and return the maximum profit you can achieve.

class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        profit = 0

        for i in range(1, len(prices)):
            
            if prices[i-1] < prices[i]:
                profit += prices[i]-prices[i-1]

        return profit


if __name__ == "__main__":
    test_case = list([7, 1, 5, 3, 6, 4])
    expected = 7

    solution = Solution()

    result = solution.maxProfit(test_case)

    if result == expected:
        print("PASSED")
    else:
        print("FAILED")
