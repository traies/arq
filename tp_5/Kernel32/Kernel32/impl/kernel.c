
char *video = (char *) 0xB8000;

/**********************************************
kmain()
Punto de entrada de c�digo C.
*************************************************/
void kmain()
{
	char msg[] = {'H',(char) 0x07, 'e', (char)0x18, 'l', (char)0x29, 'l',(char) 0x39, 'o', 
			(char)0x40, ' ', 0x07};
	int leng = sizeof(msg);
	int i;

	for (i = 0 ; i < leng ; i++) {
		video[i] = msg[i];
	}


	while(1){
	}
}
