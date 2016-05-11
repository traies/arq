static char * vbuff    = (char *) 0xB8000;
extern void println(const char * sptr, char ** vptr, char color );

void kernel(){
    const char * str1 = "a";
    const char * str2 = "            ";
    char * v = vbuff;
    while(1){
        println(str1, &v, (char) 0x29);
        println(str2, &v, (char) 0x29);
    }
}
