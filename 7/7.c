#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "func7.c"


int main(int argc, char *argv[]) {
    FILE *input_file, *output_file;
    input_file = fopen(argv[1], "r");
    
    int n;
    fscanf(input_file, "%d", &n);
    int a[n], b[n];
    for(int i = 0; i < n; i++) {
        fscanf(input_file, "%d", &a[i]);
    }
    fclose(input_file);

    aToB(a, n, b);
    output_file = fopen(argv[2], "w");
    fprintf(output_file, "Size: %d\n", n);
    for (unsigned int i = 0; i < n; i++) {
        fprintf(output_file, "%d ", b[i]);
    }
    fprintf(output_file, "\n");
    printf("the result is written to a file \"%s\"\n", argv[2]);
    fclose(output_file);
    return 0;
}
