#include "s21_cat.h"

int main(int argc, char *argv[]) {
    struct flags flags = {0};
    int is_running = 0;

    for (int i = 1; i < argc && is_running == 0; i++) {
        int arg_length = (int) strlen(argv[i]);

        if (argv[i][0] == '-') {
            for (int j = 1; j < arg_length; j++) {
                switch (argv[i][j]) {
                    case 'b': {
                        flags.b = 1;

                        break;
                    }
                    case 'e': {
                        flags.e = 1;
                        flags.v = 1;

                        break;
                    }
                    case 'E': {
                        flags.e = 1;

                        break;
                    }
                    case 'n': {
                        flags.n = 1;

                        break;
                    }
                    case 's': {
                        flags.s = 1;

                        break;
                    }
                    case 't': {
                        flags.t = 1;
                        flags.v = 1;

                        break;
                    }
                    case 'T': {
                        flags.t = 1;

                        break;
                    }
                    case 'v': {
                        flags.v = 1;

                        break;
                    }
                    case '-': {
                        if (strcmp((argv[i] + 2), "number-nonblank") == 0) {
                            flags.b = 1;
                            j += 15;
                        } else if (strcmp((argv[i] + 2), "number") == 0) {
                            flags.n = 1;
                            j += 6;
                        } else if (strcmp((argv[i] + 2), "squeeze-blank") == 0) {
                            flags.s = 1;
                            j += 13;
                        }

                        break;
                    }
                    default: {
                        printf("cat: illegal option -- %c\n", argv[i][j]);
                        printf("usage: cat [-benstuv] [file ...]\n");
                        is_running++;

                        break;
                    }
                }
            }
        }
    }

    for (int i = 1; i < argc && is_running == 0; i++) {
        if (argv[i][0] != '-') {
            handler(argv[i], &flags);
        }
    }

    return 0;
}

void handler(char *filename, struct flags *flags) {
    FILE *file;
    if ((file = fopen(filename, "r")) == NULL) {
        printf("cat: %s: No such file or directory\n", filename);
    } else {
        char ch = (char) fgetc(file);
        int string_number = 1;

        if (flags->b == 1 && flags->n == 1) {
            flags->n = 0;
        }

        if ((flags->b == 1 || flags->n == 1) && ch != '\n') {
            printf("%6u\t", string_number);
            string_number++;
        }

        while (ch != EOF) {
            if (ch == '\n') {
                if (flags->e == 1) {
                    printf("$");
                }

                printf("%c", ch);
                ch = (char) fgetc(file);

                if ((flags->b == 1 || flags->s == 1) && ch == '\n') {
                    if (flags->s == 1) {
                        if (flags->n == 1) {
                            printf("%6u\t", string_number);
                            string_number++;

                            if (flags->e == 1) {
                                printf("$");
                            }
                        }

                        if (flags->e == 1 && flags->n == 0) {
                            printf("$");
                        }

                        printf("%c", ch);
                    }

                    while (ch == '\n') {
                        if (flags->e == 1 && flags->s == 0) {
                            printf("$");
                        }

                        if (flags->s == 0 && flags->b == 1) {
                            printf("%c", ch);
                        }

                        ch = (char) fgetc(file);
                    }
                }

                if ((flags->n == 1 || flags->b == 1) && ch != EOF) {
                    printf("%6u\t", string_number);
                    string_number++;
                }
            } else {
                if (ch == '\t' && flags->t == 1) {
                    printf("^I");
                } else if (flags->v == 1) {
                    if ((ch >= 0 && ch < 9) || (ch > 10 && ch < 32)) {
                        printf("^%c", ch + 64);
                    } else if (ch == 127) {
                        printf("^%c", ch - 64);
                    } else {
                        printf("%c", ch);
                    }
                } else {
                    printf("%c", ch);
                }

                ch = (char) fgetc(file);
            }
        }

        fclose(file);
    }
}
