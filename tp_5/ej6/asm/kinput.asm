GLOBAL kstatus, kinput

section .text
kstatus:
  in al, 64h
  and al, 0x1
  ret

kinput:
  in al, 60h
  ret
