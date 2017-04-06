#include <stdio.h>

unsigned int pile[1000];

unsigned int recursive_fib(unsigned int n)
{
    if (n < 3) {
        return 1;
    }

    return recursive_fib(n-2) + recursive_fib(n-1);
}

unsigned int iterative_fib(unsigned int n)
{
    unsigned int i;

    if (n < 3) {
        return 1;
    }

    pile[0] = 1;
    pile[1] = 1;
    for (i = 2;  i < (n -1) ; i++) {
        pile[i] = pile[i-1] + pile[i-2];
    }

    return pile[i-1] + pile[i-2];
}
