#!/bin/bash

# Default

./s21_grep for s21_grep.c > s21_grep.txt
grep for s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -e

./s21_grep -e for s21_grep.c > s21_grep.txt
grep -e for s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep s21_grep.c -e for > s21_grep.txt
grep s21_grep.c -e for > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e "for (int" s21_grep.c -e int > s21_grep.txt
grep -e "for (int" s21_grep.c -e int > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e char -e expression s21_grep.c -e for -e int > s21_grep.txt
grep -e char -e expression s21_grep.c -e for -e int > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -e ^int > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e ^int s21_grep.c > s21_grep.txt
grep -e ^int s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -i

./s21_grep -e char -e expression s21_grep.c -e for -e int -i > s21_grep.txt
grep -e char -e expression s21_grep.c -e for -e int -i > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -c

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i -c > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i -n -c > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -i -e ^int -n -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -n

./s21_grep -e for s21_grep.c -e ^int -n > s21_grep.txt
grep -e for s21_grep.c -e ^int -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -n > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -e ^int -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i -n > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -i -e ^int -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for s21_grep.c -e ^int -n -v > s21_grep.txt
grep -e for s21_grep.c -e ^int -n -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -c

./s21_grep -e for s21_grep.c s21_grep.h Makefile -e ^int -i -n -c > s21_grep.txt
grep -e for s21_grep.c s21_grep.h Makefile -i -e ^int -n -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep a s21_grep.c s21_grep.h Makefile -l -c > s21_grep.txt
grep a s21_grep.c s21_grep.h Makefile -l -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -l -c > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -l -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep a s21_grep.c -l -c > s21_grep.txt
grep a s21_grep.c -l -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c -l -c > s21_grep.txt
grep for s21_grep.c -l -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -v

./s21_grep for s21_grep.c -v > s21_grep.txt
grep for s21_grep.c -v> grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c -v -c > s21_grep.txt
grep for s21_grep.c -v -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c -v -c -l > s21_grep.txt
grep for s21_grep.c -v -c -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -v > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -v -l > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -v -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep s21_grep.c s21_grep.h Makefile -v -l -c -i -e a > s21_grep.txt
grep s21_grep.c s21_grep.h Makefile -v -l -c -i -e a > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep s21_grep.c s21_grep.h Makefile -v -c -i -e a > s21_grep.txt
grep s21_grep.c s21_grep.h Makefile -v -c -i -e a > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -h

./s21_grep for s21_grep.c s21_grep.h Makefile -h > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -i > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -i > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -l > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -v > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -c > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -n > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -v -l > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -v -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -n -l > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -n -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -n -v > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -n -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -c -v > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -c -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -c -n > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -n -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -c -l > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -c -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -i -c > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -i -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep for s21_grep.c s21_grep.h Makefile -h -i -n > s21_grep.txt
grep for s21_grep.c s21_grep.h Makefile -h -i -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Flag -o

# Simple tests

./s21_grep o s21_grep.c s21_grep.h Makefile -o > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o > s21_grep.txt
grep o s21_grep.c -o > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o > s21_grep.txt
grep -e for -e ^int s21_grep.c -o > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Combinations with -c

./s21_grep o s21_grep.c s21_grep.h Makefile -o -c > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -c > s21_grep.txt
grep o s21_grep.c -o -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -c > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -c > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Combinations with -l

./s21_grep o s21_grep.c s21_grep.h Makefile -o -l > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -l > s21_grep.txt
grep o s21_grep.c -o -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -l > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -l > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -l > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Combinations with -n

./s21_grep o s21_grep.c s21_grep.h Makefile -o -n > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -n > s21_grep.txt
grep o s21_grep.c -o -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -n > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -n > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Combinations with -h

./s21_grep o s21_grep.c s21_grep.h Makefile -o -h > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -h > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -h > s21_grep.txt
grep o s21_grep.c -o -h > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -h > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -h > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -h > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -h > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Combinations with -v

./s21_grep o s21_grep.c s21_grep.h Makefile -o -v > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -v > s21_grep.txt
grep o s21_grep.c -o -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -v > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -v > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

# Triple combinations

./s21_grep o s21_grep.c s21_grep.h Makefile -o -h -n > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -h -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -h -n > s21_grep.txt
grep o s21_grep.c -o -h -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -h -n > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -h -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -h -n > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -h -n > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

#

./s21_grep o s21_grep.c s21_grep.h Makefile -o -l -v > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -l -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -l -v > s21_grep.txt
grep o s21_grep.c -o -l -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -l -v > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -l -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -l -v > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -l -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

#

./s21_grep o s21_grep.c s21_grep.h Makefile -o -c -v > s21_grep.txt
grep o s21_grep.c s21_grep.h Makefile -o -c -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep o s21_grep.c -o -c -v > s21_grep.txt
grep o s21_grep.c -o -c -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -c -v > s21_grep.txt
grep -e for -e ^int s21_grep.c s21_grep.h Makefile -o -c -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e for -e ^int s21_grep.c -o -c -v > s21_grep.txt
grep -e for -e ^int s21_grep.c -o -c -v > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt