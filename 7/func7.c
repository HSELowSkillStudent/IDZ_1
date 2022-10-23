#include <stddef.h>

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
