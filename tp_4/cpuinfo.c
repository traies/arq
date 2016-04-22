extern int altcpuinfo(char * buff);
extern int altwrite(int fd, const char * buff, int count);

int main(){
    char buff [12];
    altcpuinfo(buff);
    buff[12] = 0;
    altwrite(1, buff, 12);
    return 0;
}
