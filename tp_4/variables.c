//variables.c

//variables1.c
int foo() {
    int numero; //se reserva espacio en el stack [ sub esp, 4]
}

//variables2.c
int foo() {
    int numero = 21; // sub esp, 4
                     // mov [ebp-4], 21
}

//variables3.c
int numero;         // section .bss
                    //   numero: resb 4
int foo() {
    numero = 21;    // mov [numero], 21
}

//variables4.c
int foo() {
    static int numero = 21;   //section .data
                              //    numero: .word 21

}

//variables5.c
extern int numero;
int foo() {
     numero = 10;             //mov [numero], 10
}

//variables6.c
int numero = 21;              // .data
int bar() {                   //    numero dw 21
   numero = 30;               // mov [numero], 30
}

//variables7.c
static int numero = 10;       // .data
int foo() {                   //    numero dw 10
   numero = 20;               // mov [numero], 20
}
