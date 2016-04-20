//lineprint.c
extern int altopen(const char * pathname, int flags, mode_t mode);
extern int altclose(const char * pathname, int flags, mode_t mode);
extern int altread(size fd, void *buf, size_t count);
extern int altwrite(size_t fd, void *buf, size_t count);
extern int altexit();


int main(int argc, char*argv[]){
  int fd = altopen("hola", 0, 077);
}
