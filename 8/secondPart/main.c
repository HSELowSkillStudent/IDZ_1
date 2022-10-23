#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "notOptimizedFunc.c"

int* random_array(int size) {
    int *a;
    a = malloc(sizeof(int) * size);
    for (int i = 0; i < size; i++) {
        a[i] = rand() % 100;
        if (rand() % 2 == 0) {
            a[i] = -a[i];
        }
    }
    return a;
}

void print_array(int a[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

int main() {
    long long int start, end;
    srand(time(NULL));
    for (int i = 0; i < 10; i++) {
        printf("test %d\n", i);
        int size = rand() % 1000000;
        int *a = random_array(size);
        int b[size];
        start = time(NULL);
        for (int j = 0; j < 10000; j++) {
            aToBNO(a, size, b);
        }
        end = time(NULL);
        printf("\tunoptimized function time:\t%lld\n", (end - start) % 1000);
        start = time(NULL);
        for (int j = 0; j < 10000; j++) {
            aToBNO(a, size, b);
        }
        end = time(NULL);
        printf("\toptimized function time:  \t%lld\n\n", (end - start) % 1000);
    }
}
