//variables3.c
int numero;         // section .bss
                    //   numero: resb 4
int foo() {
    numero = 21;    // mov [numero], 21
}
