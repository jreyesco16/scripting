//  Date: 04-26-2022 
//
//  1.3 URLify: write method spaces in string with '%20' (assume the string has sufficient space at the end of to hold the additional characters )

#include <iostream>

using namespace std;

string moveUpOne(string s, int i) {

    for(int j = i; j < s.length(); j++) {
        cout << s[j] << "\n";
    }

    return s;
}

string findEmptySpace(string s) {
    // find first empty space in string
    for(int i=0; i < s.length(); i++) {
        if(s[i]==' '){
            cout << s[i] << "\n";
        }
    };

    return s;
};

string urlIfy(string s) {

    findEmptySpace(s);

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