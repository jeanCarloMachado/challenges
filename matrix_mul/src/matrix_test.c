#include "../vendor/unity.h"
#include "fib.h"
#include <stdlib.h>


void setUp()
{
}

void tearDown()
{
}

void test_simplest(void)
{
    int matrix_a[2][2] = {
        {2, 2}
        {2, 2}
    };

    int matrix_b[2][2] = {
        {3, 3}
        {3, 3}
    };

    int matrix_should[2][2] = {
        {6, 6}
        {6, 6}
    };


    matrix_result = matrix_mul(matrix_a, matrix_b);

    TEST_ASSERT(matrix_result[0, 0] == matrix_should[0,0]);
}

int main(void) {

    UNITY_BEGIN();

    RUN_TEST(iterative_fib_test);

    return UNITY_END();
}

