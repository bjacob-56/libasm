#include "libasm.h"

int main()
{
	int res;
	char *dest;
	char *src = "abc123456";
	
	res = ft_strlen("abcdefg");
	printf("len = %d\n", res);
	dprintf(1, "  -----  \n");

	dest = ft_strcpy(dest, src);
	printf("dest = %s\n", dest);
}