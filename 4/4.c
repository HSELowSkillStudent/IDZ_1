#include <stdio.h>

int main() {
    unsigned int n;
    printf("Enter n: ");
    scanf("%ud", &n);
    int a[n], b[n]; // ok
    int flag = 1; // ok
    printf("Enter array a:\n");
    for (unsigned int i = 0; i < n; i++) {  // цикл 1
        scanf("%d", &a[i]);
    }
    for (unsigned int i = 0; i < n; i++) {  // цикл 2
        if (a[i] > 0) {
            flag = 0;
        }
        if (flag) {
            b[i] = a[i] - 5;
        } else {
            b[i] = a[i];
        }
    }
    printf("Array b:\n");
    for (unsigned int i = 0; i < n; i++) {  // цикл 3
        printf("%d ", b[i]);
    }
    printf("\n");

    return 0;
}
