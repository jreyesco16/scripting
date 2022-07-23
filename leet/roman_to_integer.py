class Solution:
    def romanToInt(self, s: str) -> int:

        romans = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }

        sum = 0

        i = 0
        while i != len(s):
            # edge case 1
            if i==len(s)-1:
                sum+=romans[s[i]]
                break

            # edge case 2
            if romans[s[i]] < romans[s[i+1]]:
                sum += (romans[s[i+1]] - romans[s[i]])
                # should skip 1
                i+=2
                continue

            sum += romans[s[i]]
            i+=1

        return sum


def main():
    test_case = "MCMXCIV"
    expected = 1994

    solution = Solution()

    output = solution.romanToInt(test_case)

    if expected == output:
        print("PASSED")
    else:
        print("FAILED")


if __name__ == "__main__":
    main()
