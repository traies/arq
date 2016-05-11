static char * vbuff    = (char *) 0xB8000;
extern void println(const char * sptr, char ** vptr, char color );
extern int min();
extern int sec();
extern int hour();
extern void set();
void printint(int val, char ** vptr, char color);
void printintw(int val, char ** vptr, char color);

void kernel(){
    char * v = vbuff;
    int s;
    set();
    while(1){
      v = vbuff;
      printint(hour(), &v, 0x29);
      println(" hour, ", &v, 0x29);
      printint(min(), &v, 0x29);
      println(" min, ", &v, 0x29);
      printint(sec(), &v, 0x29);
      println(" secs, ", &v, 0x29);
    }
}


void printint(int val, char ** vptr, char color){
  if (val == 0) {
    println("0", vptr, color);
  }
  else {
    printintw(val, vptr, color);
  }
}

void printintw(int val, char ** vptr, char color){
    if (!val){
        return;
    }
    printintw(val/10, vptr, color);
    const char c =  val % 10 + '0';
    println(&c, vptr, color);
    return;
}
