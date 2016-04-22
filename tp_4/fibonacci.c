#include<stdio.h>

int fibonacci(int n);
int main(){
    int f = fibonacci(6);
    printf("%d\n", f);
}

int fibonacci(int n){
    if (n < 2){
        return 1;
    }
    int n1 = fibonacci(n-1);
    int n2 = fibonacci(n-2);
    return n1 + n2;
}

// 1 1 2 3 5 8 13
/* posible salida asm,
fibonacci:
    and esp, -4    ; alineamiento a palabra
    push ebp
    mov ebp, esp
                    ; ignoro el canary (compilo con -fno-stack-protector)
    sub esp, 8      ; reservo memoria para n1 y n2
    cmp [ebp + 8], 2
    jge .lp1
    mov eax, 1
    jmp .lp2
.lp1:
    mov ebx, dword[ebp + 8]
    sub ebx, 1
    push ebx
    call fibonacci
    add esp, 4
    mov [esp + 8], eax
    mov ebx, [ebp + 8]
    sub ebx, 2
    push ebx
    call fibonacci
    add esp, 4
    mov [esp + 4], eax
    mov eax, [esp + 8]
    mov edx, [esp + 4]
    add eax, edx
.lp2:
    leave
    ret
*/
