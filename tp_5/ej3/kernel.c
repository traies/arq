static char * vbuff    = (char *) 0xB8000;
extern void println(const char * sptr, char ** vptr, char color );
extern int min();
extern int sec();
extern int hour();
extern void set();
void printint(int val, char ** vptr, char color);
void printintw(int val, char ** vptr, char color);
void print_bcd(char num, char ** vptr, char color);
char convert_bcd(char byte, char bool);


void kernel(){
    char * v = vbuff;
    int s;
    while(1){
      v = vbuff;
      //printint(hour(), &v, 0x29);
      print_bcd(hour(), &v, 0x29);
      println(" hour, ", &v, 0x29);
      print_bcd(min(), &v, 0x29);
      println(" min, ", &v, 0x29);
      print_bcd(sec(), &v, 0x29);
      println(" sec", &v, 0x29);
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
    const char c [2];
    c[0] =  val % 10 + '0';
    c[1] = 0;
    println(&c, vptr, color);
    return;
}
void print_bcd(char num, char ** vptr, char color){
  char c = convert_bcd(num, 0) + '0';
  println(&c, vptr, color);
  c = convert_bcd(num, 1) + '0';
  println(&c, vptr, color);

}
char convert_bcd(char byte, char high){
  if (high){
    byte = byte & 0x0F;
  }
  else{
    byte = (byte & 0xF0) >> 4;
  }
  return byte;
}
