#include "s21_grep.h"

int main(int argc, char *argv[]) {
    struct flags flags = {};

    int is_running = 0;
    int ef_flags_exist = 0;

    char *patterns[100];
    int patterns_number = 0;

    char *pattern_files[100];
    int pattern_files_number = 0;

    char *files[100];
    int files_number = 0;

    // Проверяем есть ли в агрументах флаги -e или -f
    for (int i = 1; i < argc; i++) {
        if (argv[i][0] == '-') {
            if (argv[i][1] == 'e' || argv[i][1] == 'f') {
                ef_flags_exist = 1;
            }
        }
    }

    // Парсим аргументы
    for (int i = 1; i < argc && is_running == 0; i++) {
        int arg_length = (int) strlen(argv[i]);

        if (argv[i][0] == '-') {
            for (int j = 1; j < arg_length && is_running == 0; j++) {
                switch (argv[i][j]) {
                    case 'e': {
                        flags.e += 1;
                        ef_flags_exist = 0;

                        break;
                    }
                    case 'i': {
                        flags.i = 1;

                         break;
                    }
                    case 'v': {
                        flags.v = 1;

                        break;
                    }
                    case 'c': {
                        flags.c = 1;

                        break;
                    }
                    case 'l': {
                        flags.l = 1;

                        break;
                    }
                    case 'n': {
                        flags.n = 1;

                        break;
                    }
                    case 'h': {
                        flags.h = 1;

                        break;
                    }
                    case 'o': {
                        flags.o = 1;

                        break;
                    }
                    case 's': {
                        flags.s = 1;

                        break;
                    }
                    case 'f': {
                        flags.f = 1;
                        ef_flags_exist = 0;

                        break;
                    }
                    default: {
                        // ERROR - invalid option
                        fprintf(stderr, "grep: invalid option -- z\n"
                            "usage: grep [-abcDEFGHhIiJLlmnOoqRSsUVvwxZ] [-A num] [-B num] [-C[num]]\n"
                            "        [-e pattern] [-f file] [--binary-files=value] [--color=when]\n"
                            "        [--context[=num]] [--directories=action] [--label] [--line-buffered]\n"
                            "        [--null] [pattern] [file ...]\n");

                        is_running = 1;
                    }
                }
            }
        } else if (ef_flags_exist == 0) {
            // Считываем название файла с паттернами или паттерн и записываем указатель на него в массив
            if (argv[i - 1][0] == '-' && argv[i - 1][1] == 'f') {
                pattern_files[pattern_files_number] = argv[i];
                pattern_files_number++;
            } else {
                patterns[patterns_number] = argv[i];
                patterns_number++;
            }

            ef_flags_exist++;
        } else {
            // Считываем название файла и записываем указатель на него в массив
            files[files_number] = argv[i];
            files_number++;
        }
    }

    // Обработать -f
    char buffer_array[100][256];
    int buffer_array_counter = 0;

    if (pattern_files_number > 0) {
        for (int j = 0; j < pattern_files_number; j++) {
            FILE *file;
            if ((file = fopen(pattern_files[j], "r")) == NULL) {
                if (flags.s == 0) {
                    fprintf(stderr, "grep: %s: No such file or directory\n", pattern_files[j]);
                }
            } else {
                char ch = (char) fgetc(file);

                while (ch != EOF && buffer_array_counter < 98) {
                    int k = 0;

                    while (ch != '\n' && ch != EOF && k < 254) {
                        buffer_array[buffer_array_counter][k] = ch;
                        ch = (char) fgetc(file);
                        k++;
                    }

                    buffer_array[buffer_array_counter][k] = '\0';
                    patterns[patterns_number] = buffer_array[buffer_array_counter];
                    patterns_number++;

                    ch = (char) fgetc(file);
                    buffer_array_counter++;
                }

                fclose(file);
            }
        }
    }

    // Вызываем функцию-обработчик для каждого файла
    for (int k = 0; k < files_number && is_running == 0; k++) {
        handler(files[k], files_number, &flags, patterns, patterns_number);
    }

    // Если нет переданных аргументов выводим ошибку
    if (argc == 1) {
        fprintf(stderr, "usage: grep [-abcDEFGHhIiJLlmnOoqRSsUVvwxZ] [-A num] [-B num] [-C[num]]\n"
                        "        [-e pattern] [-f file] [--binary-files=value] [--color=when]\n"
                        "        [--context[=num]] [--directories=action] [--label] [--line-buffered]\n"
                        "        [--null] [pattern] [file ...]\n");
    }

    return 0;
}

void handler(char *filename, int files_number, struct flags *flags, char **patterns, int patterns_number) {
    FILE *file = NULL;
    regex_t regular_expression;
    int regular_expression_flag = 0;
    int string_counter = 0;

    if (flags->i != 0) {
        regular_expression_flag |= REG_ICASE;
    }

    if ((file = fopen(filename, "r")) == NULL) {
        if (flags->s == 0) {
            fprintf(stderr, "grep: %s: No such file or directory\n", filename);
        }
    } else {
        int string_number = 1;
        char buffer_string[1024] = "";

        char ch = (char) fgetc(file);

        while (ch != EOF) {
            // Считываем строку из файла в буфер
            int i = 0;

            while (ch != '\n' && ch != EOF) {
                buffer_string[i] = ch;
                ch = (char) fgetc(file);
                i++;
            }

            buffer_string[i] = '\0';

            // Костыль
            if (flags->e == 0) {
                flags->e = 1;
            }

            // Ищем паттерны в буферной строке
            int is_found = 0;
            regmatch_t text_pattern[1];
            int is_file_written = 0;
            int is_string_written = 0;

            for (int j = 0; j < patterns_number; j++) {
                // Компилируем регулярное выражение (regular_expression)
                regcomp(&regular_expression, patterns[j], regular_expression_flag);

                if (regexec(&regular_expression, buffer_string, 1, text_pattern, 0) == 0) {
                    if (flags->o > 0 && flags->v == 0 && flags->c == 0 && flags->l == 0 &&
                        flags->h == 0 && is_file_written == 0 && files_number > 1) {
                        printf("%s:", filename);
                        is_file_written++;
                    }
                    if (flags->o > 0 && flags->v == 0 && flags->n > 0 && flags->c == 0 &&
                        flags->l == 0 && is_string_written == 0) {
                        printf("%d:", string_number);
                        is_string_written++;
                    }

                    if (flags->o > 0 && flags->v == 0 && flags->c == 0 && flags->l == 0) {
                        char *buffer_pointer = buffer_string;

                        while (regexec(&regular_expression, buffer_pointer, 1, text_pattern, 0) == 0) {
                            int k;

                            for (k = (int) text_pattern[0].rm_so; k < (int) text_pattern[0].rm_eo; ++k) {
                                printf("%c", buffer_pointer[k]);
                            }

                            buffer_pointer += k;
                            printf("\n");
                        }
                    }

                    is_found++;
                }

                regfree(&regular_expression);
            }

            if (((is_found > 0 && flags->v == 0) || (is_found == 0 && flags->v > 0))) {
                if (((flags->o == 0) || (flags->o > 0 && flags->v > 0)) &&
                      flags->c == 0 && flags->l == 0 && files_number > 1) {
                    if (flags->h == 0) {
                        printf("%s:", filename);
                    }

                    if (flags->n > 0) {
                        printf("%d:", string_number);
                    }

                    printf("%s\n", buffer_string);
                } else if (((flags->o == 0) || (flags->o > 0 && flags->v > 0)) &&
                             flags->c == 0 && flags->l == 0) {
                    if (flags->n > 0) {
                        printf("%d:", string_number);
                    }

                    printf("%s\n", buffer_string);
                }

                string_counter++;
            }

            memset(buffer_string, '\0', 1024);
            ch = (char) fgetc(file);
            string_number++;
        }

        if (files_number > 1 && flags->c > 0) {
            if (flags->l > 0 && string_counter > 0) {
                if (flags->h == 0) {
                    printf("%s:", filename);
                }
                printf("%d\n", 1);
            } else {
                if (flags->h == 0) {
                    printf("%s:%d\n", filename, string_counter);
                } else {
                    printf("%d\n", string_counter);
                }
            }
        } else if (flags->c > 0) {
            if (flags->l > 0 && string_counter > 0) {
                printf("%d\n", 1);
            } else {
                printf("%d\n", string_counter);
            }
        }

        if (flags->l > 0 && string_counter > 0) {
            printf("%s\n", filename);
        }

        fclose(file);
    }
}
