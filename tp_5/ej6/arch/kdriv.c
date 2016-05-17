static const char map[] = { '\0', '\0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '\'', '¿', '\b',
						'\t', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '\0', '+', '\n',
						'\0', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ñ', '{', '|', '\0',
						'}', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', '\0', '\0', '\0', ' '
					};
static const int size = sizeof(map);

char get_key(char code) {
  if (code > 0 && code < size) {
    return map[code];
  }
  return 0;
}
