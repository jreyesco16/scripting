//   Date: 04-26-2022
//
//   1.2 Check Permutation : given two strings, write a method to decide if one is a permutation of the other

#include <iostream>

using namespace std;

string sortString(string str) {
    sort(str.begin(), str.end());

    return str;
}

bool checkPermutation(string str1, string str2) {
    // check if str2 is a permutation of str2 
    if (sortString(str1).compare(sortString(str2)) == 0) return true;
    
    return false;

}

int main() {
    string str1 = "tac";
    string str2 = "cat";

    bool expected = true;
    bool result = checkPermutation(str1, str2);

    if (result == expected) {
        cout << "PASSED\n";
    };

};
