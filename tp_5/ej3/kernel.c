static char * vbuff    = (char *) 0xB8000;
extern void println(const char * sptr, char ** vptr, char color );
extern int min();
extern int sec();
extern int hour();
void printint(int val, char ** vptr, char color);

void kernel(){
    char * v = vbuff;
    printint(hour(), &v, 0x29);
    println(" hours, ", &v, 0x29);
    printint(min(), &v, 0x29);
    println(" mins, ", &v, 0x29);
    printint(sec(), &v, 0x29);
    println(" secs, ", &v, 0x29);

    while(1){
    }
}

void printint(int val, char ** vptr, char color){
    if (!val){
        return;
    }
    printint(val/10, vptr, color);
    const char c =  val % 10 + '0';
    println(&c, vptr, color);
    return;
}
