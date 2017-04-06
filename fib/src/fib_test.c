#include "../vendor/unity.h"
#include "fib.h"
#include <stdlib.h>


void setUp()
{
}

void tearDown()
{
}

void recursive_fib_test(void)
{
    TEST_ASSERT(recursive_fib(1) == 1);
    TEST_ASSERT(recursive_fib(2) == 1);
    TEST_ASSERT(recursive_fib(3) == 2);
    TEST_ASSERT(recursive_fib(4) == 3);
    TEST_ASSERT(recursive_fib(5) == 5);
    TEST_ASSERT(recursive_fib(6) == 8);
    TEST_ASSERT(recursive_fib(7) == 13);
}

void iterative_fib_test(void)
{
    TEST_ASSERT(iterative_fib(1) == 1);
    TEST_ASSERT(iterative_fib(2) == 1);
    TEST_ASSERT(iterative_fib(3) == 2);
    TEST_ASSERT(iterative_fib(4) == 3);
    TEST_ASSERT(iterative_fib(5) == 5);
    TEST_ASSERT(iterative_fib(6) == 8);
    TEST_ASSERT(iterative_fib(7) == 13);
}

int main(void) {

    UNITY_BEGIN();

    RUN_TEST(recursive_fib_test);
    RUN_TEST(iterative_fib_test);

    return UNITY_END();
}

