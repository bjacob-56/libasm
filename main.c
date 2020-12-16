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
	char *dest;
	char *src = "abc123456";
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
	int	size = ft_write(fd, buffer, 4);
	dprintf(1, "size = %d\n");
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_read ----  \n");
	char buf[100];
	size = ft_read(fd, buf, 10);
	dprintf(1, "buf = %s, size = %d\n", buf, size);
	dprintf(1, "  -------------------  \n\n");

}