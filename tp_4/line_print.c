//lineprint.c
extern int altopen(const char * pathname, int flags, int mode);
extern int altclose(const char * pathname, int flags, int mode);
extern int altread(int fd, void *buf, int count);
extern int altwrite(int fd, const void *buf, int count);
extern int altexit();

int main(int argc, char*argv[]){
    int n = 1;
    while (n < argc){
        int fd = altopen(argv[n], 0, 700);
        int line_length;
        char buff[80];
        while ( (line_length = altread(fd, buff, 80)) > 0 ){
            altwrite(1, buff, line_length);
        }
        altclose(argv[n], 0, 700);
        n++;
    }
    altexit();
    return 0;
}
