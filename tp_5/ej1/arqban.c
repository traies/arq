char * videobuff = (char *) 0xB8000;

void arqban(){
    const char * banner = "Arquitectura de computadoras";
    while(*banner){
        *(videobuff++) = *(banner++);
        *(videobuff++) = (char)  0x29;
    }
    while(1);
}
