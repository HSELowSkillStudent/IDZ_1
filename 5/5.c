#include <stdio.h>

void aToB(const int *a, size_t size, int *result) {
    int flag = 1;  // локальная переменная
    for (size_t i = 0; i < size; i++) {
        if (a[i] > 0) {
            flag = 0;
        }
        if (flag) {
            result[i] = a[i] - 5;
        } else {
            result[i] = a[i];
        }
    }
}


int main() {
    unsigned int n;
    printf("Enter n: ");
    scanf("%ud", &n);
    int a[n], b[n];
    printf("Enter array a:\n");
    for (unsigned int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    aToB(a, n, b);
    printf("Array b:\n");
    for (unsigned int i = 0; i < n; i++) {
        printf("%d ", b[i]);
    }
    printf("\n");

    return 0;
}
