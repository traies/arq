;cpuinfo.asm
GLOBAL altcpuinfo

section .text

; int cpuinfo(char * buff)
altcpuinfo:
    push ebp
    mov ebp, esp

    mov eax, 0
    cpuid

    push eax
    mov eax, [ebp + 8]
    mov dword[eax], ebx
    mov dword[eax + 4 ], ecx
    mov dword[eax + 8 ], edx
    pop eax
    leave
    ret
