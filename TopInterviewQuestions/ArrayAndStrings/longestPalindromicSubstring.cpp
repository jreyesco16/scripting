// Author: Jesse Reyes Cortes
// Date : 08/18/2021 (can't solve this stupid thing) 
// Name: Longest Palindromic Substring
// Description: given a string s, return the longest palindromic substring in s

#include <string>
#include <iostream>
#include <cmath>


using namespace std;

class Solution {
    public:
        string longestPalindromicSubstring(string s) {
            string longestPalindromeString = s;

            if (checkPalindome(s)) return s;

            bool found = false;
            while ( !found ) {
                string first = longestPalindromeString.substr(1, longestPalindromeString.length()-1);

                if (checkPalindome(first)) {
                    found = true;
                    longestPalindromeString = first;
                    continue;
                }

                string second = longestPalindromeString.substr(0, longestPalindromeString.length()-1);

                if (checkPalindome(second)) {
                    found = true;
                    longestPalindromeString = second;
                }

                if (!found) {
                    longestPalindromeString = longestPalindromeString.substr(1, longestPalindromeString.length()-1);
                    continue;
                }
            };

            return longestPalindromeString;
        };

        bool checkPalindome(string s) {
            if (s.length() < 2) return true;

            int pivot = (s.length() / 2);

            string first = s.substr(0, pivot);

            string second = reverseString(s.substr(pivot + (s.length() % 2)));

            return first.compare(second) == 0 ? true : false;
        };

        string reverseString(string s) {
            string reverse = "";

            for (int i = s.length()-1; i >= 0; i--) reverse += s[i];

            return reverse;
        };
};


// test fuction
int main() {
    Solution solution;

    string testCase = "ac";

    string result = solution.longestPalindromicSubstring(testCase);

    string expected = "a";

    cout << "Result " << result << "\n";

    if (result.compare(expected) != 0) {
       cout << "\nResult don't match!\n"; 
    } else {
       cout << "\nResult match!\n"; 
    } 
};