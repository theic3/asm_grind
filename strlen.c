#include <stdio.h>

size_t strlen (char *str) {
	size_t len = 0;
	while (*str != '\0') {
		str++;
		len++;
	}
	return len;
}

int main(int argc, char *argv[]) {
	size_t string_length;
	if (argc > 2) {
		puts("Too many arguments\n");
	} else if (argc == 2) {
		string_length = strlen(argv[1]);
		printf("String length: %ld\n", string_length);
	} else {
		puts("Pass in at least 1 arugment\n");
	}
}
