#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "func8.c"


void check_len(int size) {
    if ((size < 0) || (size > 10000)) {
        printf("The size of the array should be from 0 to 10000\n");
        exit(-1);
    }
}

void print_array(int a[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");
}

void file_input(char input_name[], char output_name[]) {
    FILE *input_file, *output_file;
    input_file = fopen(input_name, "r");

    int n;
    fscanf(input_file, "%d", &n);
    check_len(n);
    int a[n], b[n];
    for(int i = 0; i < n; i++) {
        fscanf(input_file, "%d", &a[i]);
    }
    fclose(input_file);

    aToB(a, n, b);

    output_file = fopen(output_name, "w");
    fprintf(output_file, "Size: %d\n", n);
    for (unsigned int i = 0; i < n; i++) {
        fprintf(output_file, "%d ", b[i]);
    }
    fprintf(output_file, "\n");
    printf("the result is written to a file \"%s\"\n", output_name);
    fclose(output_file);
}

void def_input() {
    int n;
    printf("Enter n: ");
    scanf("%ud", &n);
    check_len(n);
    int a[n], b[n];
    printf("Enter array a:\n");
    for (unsigned int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
    aToB(a, n, b);
    printf("Array b:\n");
    print_array(b, n);
}

void arg_input(int argc, char *argv[]) {
    check_len(argc - 1);
    int a[argc - 1], b[argc - 1];
    for (int i = 1; i < argc; i++) {
        a[i - 1] = atof(argv[i]);
    }
    aToB(a, argc - 1, b);
    printf("Array b:\n");
    print_array(b, argc - 1);
}

void random_input(int size) {
    check_len(size);
    int a[size], b[size];
    for (int i = 0; i < size; i++) {
        a[i] = rand() % 100;
        if (rand() % 2 == 0) {
            a[i] = -a[i];
        }
    }
    printf("Array a:\n");
    print_array(a, size);
    aToB(a, size, b);
    printf("Array b:\n");
    print_array(b, size);
}

int main(int argc, char *argv[]) {
    srand(time(NULL));

    if (argc == 1) {
        // вызов функции, задающей массив а через  взаимодействие с консолью
        def_input();
    } else if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help")) {
            printf("keys:\n-h (--help)  - displays a list of keys\n-r [int] (--random [int])  - sets a random data set. \n-f [string] [string] (--file [string] [string])  - the program works with files entered by the following two arguments\n");
    } else if (!strcmp(argv[1], "-r") || !strcmp(argv[1], "--random")) {
            // вызов функции, задающей массив а через генератор случайных чисел. Рзамер задается после флага
            random_input(atof(argv[2]));
    } else if (!strcmp(argv[1], "-f") || !strcmp(argv[1], "--file")) {
            // работа с файлами
            file_input(argv[2], argv[3]);
    } else {
            // работа с аргументами
            arg_input(argc, argv);
    }
    return 0;
}
