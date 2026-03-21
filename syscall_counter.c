#include <stdio.h>
#include <unistd.h>

int main() {
    printf("Testing Linux syscalls\n");

    for(int i=0;i<5;i++){
        printf("PID: %d\n", getpid());
        sleep(1);
    }

    return 0;
}
