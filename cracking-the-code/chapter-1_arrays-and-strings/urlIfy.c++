//  Date: 04-26-2022 
//
//  1.3 URLify: write method spaces in string with '%20' (assume the string has sufficient space at the end of to hold the additional characters )

#include <iostream>

using namespace std;

string urlIfy(string s) {

    return s;
};

int main() {
    string input  = "Mr John Smith    ";
    string output = "Mr%20John%20Smith";

    string result = urlIfy(input);

    if (result.compare(output) == 0) {
        cout << "PASSED\n";
    }else {
        cout << "FAILED\n";
    }
};