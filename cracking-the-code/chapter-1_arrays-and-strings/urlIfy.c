//  Date: 04-26-2022 
//
//  1.3 URLify: write method spaces in string with '%20' (assume the string has sufficient space at the end of to hold the additional characters )

#include <stdio.h>
#include <string.h>

char * moveCharsUpOne (char * s, int i) {
    char tmp;
    char tmp_2;

    for (int j = i; j < strlen(s)-1; j++) {
        if(j == i) {
            tmp = s[j+1];

            s[j+1] = s[j];
            s[j] = ' ';
            continue;
        }

        tmp_2 = s[j+1];
        s[j+1] = tmp;
        tmp = tmp_2;
    }

    return s;
}

char* urLify(char* s) {

    for (int i = 0; i < strlen(s); i++) {
        if (s[i]==' '){
            int count = 0;
            s = moveCharsUpOne(s, i);
            s[i] = '%';
            s[i+1] = '2';

            s = moveCharsUpOne(s, i+2);
            s[i+2] = '0';
        }
    }

    return s;
}

int main() {
    char input[18] = "Mr John Smith    \0";

    char *expected = "Mr%20John%20Smith";

    char *result = urLify(input);

    if (strcmp(result, expected) == 0) {
        printf("PASSED\n");
    } else {
        printf("FAILED\n");
    }

}