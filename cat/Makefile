all: build

build: s21_cat

rebuild: clean build

s21_cat: s21_cat.c
	gcc -std=c11 -D_GNU_SOURCE -Wall -Werror -Wextra ./s21_cat.c -o ./s21_cat

test:
	chmod 777 tests.sh
	./tests.sh

autotest:
	chmod 777 t_cat.sh
	./t_cat.sh

lint:
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extension=c *.c
	python3 ../../materials/linters/cpplint.py --extension=c *.h
	rm -rf *.cfg

leaks:
	CK_FORK=no leaks --atExit -- ./s21_cat

clean:
	rm ./s21_cat