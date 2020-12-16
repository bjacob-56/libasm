#include "libasm.h"

/*
RAX -> system call number
RDI -> first argument
RSI -> second argument
RDX -> third argument
R10 -> fourth argument
R8 -> fifth argument
R9 -> sixth argument
*/

int main()
{
	dprintf(1, "  ---- ft_strlen ----  \n");
	int res;
	res = ft_strlen("abcdefg");
	printf("len = %d\n", res);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcpy ----  \n");
	char *src = "abc123456";
	char *dest = malloc(ft_strlen(src) + 1);
	dest = ft_strcpy(dest, src);
	printf("dest = %s\n", dest);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcmp ----  \n");
	char	*s1 = "abcd";
	char	*s2 = "abcdef";
	int		diff;
	diff = ft_strcmp(s1, s2);
	printf("diff = %d\n", diff);
	dprintf(1, "  -------------------  \n\n");

	int fd = open("file_to_read", O_RDWR);
	dprintf(1, "fd = %d\n\n", fd);


	dprintf(1, "  ---- ft_write ----  \n");
	char *buffer = "1234567\n";
	int size = ft_write(1, buffer, 10);
	dprintf(1, "size = %d\n", size);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_read ----  \n");
	char buf[100];
	size = ft_read(fd, buf, 5);
	dprintf(1, "buf = %s\nsize = %d\n", buf, size);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strdup ----  \n");
	char *str = "0123456789";
	char *str_dup;
	// int	nb = ft_strdup(str);
	// dprintf(1, "nb = %d\n", nb);
	str_dup = ft_strdup("abcdefg");
	dprintf(1, "str_dup = %s\n", str_dup);

int k = 0;
while (k < 5)
	dprintf(1, "c = %c\n", str_dup[k++]);

	dprintf(1, "  -------------------  \n\n");

}