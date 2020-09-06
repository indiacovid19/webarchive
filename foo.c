#include <stdio.h>

int main() {
    int a[] = {2, 3, 5, 7, 11};
    printf("%d\n", *(a + 2));
    printf("%d\n", a[2]);
    printf("%d\n", 2[a]);
    return 0;
}
