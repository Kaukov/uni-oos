#include <stdio.h>

// Declaration of variables
extern int a, b;
extern int c;
extern float f;

/* Same goes for functions */
int func();

int main ()
{
    // Definition of variables
    int a, b;
    int c;
    float f;

    int i = func();

    // Initialization of variables
    a = 10;
    b = 20;

    c = a + b;
    printf("The value of c : %d \n", c);

    f = 70.0/3.0;
    printf("The value of f : %f \n", f);

    return 0;
}

int func ()
{
    return 0;
}
