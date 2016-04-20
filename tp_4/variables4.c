//variables4.c
int foo() {
    static int numero = 21;   //section .bss
                              //    numero: resb 4
                              // mov [numero], 21
}
