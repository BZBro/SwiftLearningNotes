//
//  main.c
//  1014test
//
//  Created by ZBin on 15/10/14.
//  Copyright © 2015年 ZBin. All rights reserved.
//

#include <stdio.h>
#include <math.h>

char *mystrcpy(char *str ,const char *ch){
    if (str == NULL || ch == NULL) {
        printf("(null)\n");
        return str;
    }
    int i = 0;
    for (; *(ch + i) != '\0'; i++) {
        *(str + i) = *(ch + i);
    }
    *(str + i) = '\0';
    return str;
}

void myputs(const char * str){
    if (str == NULL){
        printf("(null)\n");
    }
    for (int i = 0; *(str + i) != '\0'; i++) {
        printf("%c",*(str + i));
    }
    printf("\n");
}




void deleteSameLetter(char *st){
    int f[26] = {0};
    int j = 0;
    for (int i = 0; *(st + i) != '\0'; i++) {
        int a = *(st + i) - 'a';
        if (f[a] == 0) {
            *(st + j) = *(st + i);
            j++;
            printf("%c",*(st + i));
            f[a] = 1;
        }
    }
    *(st + j) = '\0';
}

void SelectSubString(const char *p,const char *q){
    int t = 0;
    char tempStr[30] = "";
    for (int i = 0; *(p + i) != '\0'; i++) {
        if (*(p + i) == *q ) {
            for (int j = 0; *(p + i + j) != '\0'; j++) {
                if (*(p + i + j) == *q + j) {
                    tempStr[t+j] = *(p + i + j);
                }
                else{
                    break;
                }
            }
        }
    }
}
void findNum(const char * p){
    char tempstr[50] = "";
    char tempstr2[51] = "";
    int length = 0;
    int count = 0;
    for (int i = 0; *(p + i) != '\0'; i ++) {
        int j = *(p + i) - '0';
        if (j >= 0 && j < 10) {
            tempstr[count] = *(p + i);
            count++;
            length++;
        }
        int s = *(p + i) - 'a';
        if (s >= 0) {
            mystrcpy(tempstr2, tempstr);
        }
    }
    int templeg = checkLength(tempstr);
    if (length > templeg) {
        myputs(tempstr);
    }else{
        myputs(tempstr2);
    }
    
}

int checkLength(const char *str){
    int res = 0;
    if (str == NULL) {
        printf("null\n");
            return res;
        }
    for (int i = 0; *(str + i) != '\0'; i++) {
            res++;
        }
    return res;
}
int main(int argc, const char * argv[]) {
    
    
    char str[50] = "abcd12345ad125ss123456789";
    char str2[50] = "abcd12345ed125ss56789";
    char sre3[50] = "dfdsd12345ed12543ss6789";
    findNum(str);
    printf("\n");

    return 0;
    

}
