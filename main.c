#include "libasm.h"

int main()
{
	int res;
	
	res = ft_strlen("abcdefg");
	printf("len = %d\n", res);
	dprintf(1, "  -----  \n");

	char *dest;
	char *src = "abc123456";
	dest = ft_strcpy(dest, src);
	printf("dest = %s\n", dest);
	dprintf(1, "  -----  \n");

	char	*s1 = "abc";
	char	*s2 = "abcdef";
	int		diff;
	diff = ft_strcmp(s1, s2);
	printf("diff = %d\n", diff);
	dprintf(1, "  -----  \n");

}