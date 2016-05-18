static char * vbuff    = (char *) 0xB8000;
static char * vbuffend = (char *) 0xB8FA0;

void println(const char * sptr, char ** vptr, char color ){
    while(*sptr){
      if (*vptr >= vbuffend){
          *vptr = vbuff;
      }
      *(*vptr)++ = *sptr++;
      *(*vptr)++ = color;
    }
}

void printlength(const char * sptr, char ** vptr, char color, char length){
    while(*sptr && length--){
      if (*vptr >= vbuffend){
          *vptr = vbuff;
      }
      *(*vptr)++ = *sptr++;
      *(*vptr)++ = color;
    }
}
