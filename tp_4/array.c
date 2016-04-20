//array.c
int array[20];          // .data: array: resb 80
int array[20] = {0};     // .data:
void foo(){
  int array[20];        //    sub esp, 20 * 4
  array[0] = 35;      //   sub esp, 20 * 4
                        //   mov [ebp-160+4 * 10]
                        //   mov [ebp-204], 35

  int array2[20] = {0}; //    lea edx, [ebp-164]
                        //    mov ebx, 0
                        //    mov ecx, 20
                        //.lp0:
                        //    mov [ebp-164+ebx*4], 0
                        //    add ebx, 1
                        //    cmp ebx, ecx
                        //    jnz lp0
array2[10] = 40;

}
