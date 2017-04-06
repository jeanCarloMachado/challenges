CC:="gcc"
.PHONY: test

test:
	${CC} ${DEBUG} -c src/fib.c
	${CC} ${DEBUG} -c vendor/unity.c
	${CC} ${DEBUG}  unity.o fib.o src/fib_test.c -lm -o test
	./test

