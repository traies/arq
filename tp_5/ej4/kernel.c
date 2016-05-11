static char * vbuff    = (char *) 0xB8000;
extern void println(const char * sptr, char ** vptr, char color );
extern char kstatus();
extern char kinput();
void printint(unsigned int val, char ** vptr, char color);
void printintw(unsigned int val, char ** vptr, char color);
void print_ascii(char c, char ** vptr, char color);
char convert_ascii(char c);
void start_table();
char tb [128];

void kernel(){
    char * v = vbuff;
    char c[2];
    c[1] = 0;
    char color = 0x29;
    start_table();
    while(1){
      if (kstatus()){
        
        c[0] = convert_ascii(kinput());
        println(c, &v, color);
        /*
        c[0] = kinput();
        print_ascii(c[0], &v, color);
        */
      }
    }
}

void start_table(){
  int i;
  for (i = 0; i < 128; i++ ){
    tb[i] = 0;
  }
  for (i = 2; i < 11; i++){
    tb[i] = '0' + i - 1;
  }
  tb[11] = 0;
  tb[16] = 'q';
  tb[17] = 'w';
  tb[18] = 'e';
  tb[19] = 'r';
  tb[20] = 't';
  tb[21] = 'y';
  tb[22] = 'u';
  tb[23] = 'i';
  tb[24] = 'o';
  tb[25] = 'p';
  tb[30] = 'a';
  tb[31] = 's';
  tb[32] = 'd';
  tb[33] = 'f';
  tb[34] = 'g';
  tb[35] = 'h';
  tb[36] = 'j';
  tb[37] = 'k';
  tb[38] = 'l';
  tb[44] = 'z';
  tb[45] = 'x';
  tb[46] = 'c';
  tb[47] = 'v';
  tb[48] = 'b';
  tb[49] = 'n';
  tb[50] = 'm';
  tb[57] = ' ';
}
char convert_ascii(char kin){
  if (kin < 0) return 0;
  return tb[kin];
}


void print_ascii(char c, char ** vptr, char color){
  if (c < 0){
    char arr[2] = "|";
    println(arr, vptr, color);
  }
  else {
    printint(c, vptr, color);
  }
}

void printint(unsigned int val, char ** vptr, char color){
  if (val == 0) {
    println("0", vptr, color);
  }
  else {
    printintw(val, vptr, color);
  }
}

void printintw(unsigned int val, char ** vptr, char color){
    if (!val){
        return;
    }
    printintw(val/10, vptr, color);
    char c [2];
    c[0] =  val % 10 + '0';
    c[1] = 0;
    println(c, vptr, color);
    return;
}
