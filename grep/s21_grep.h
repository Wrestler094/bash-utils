#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <stdio.h>
#include <string.h>
#include <regex.h>

struct flags {
    int e;
    int i;
    int v;
    int c;
    int l;
    int n;
    int h;
    int o;
    int s;
    int f;
};

void handler(char *filename, int files_number, struct flags *flags, char **patterns, int patterns_number);

#endif  // SRC_GREP_S21_GREP_H_
