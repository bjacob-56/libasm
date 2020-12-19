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

int main(void)
{
	dprintf(1, "  ---- ft_strlen ----  \n");
	char *str_len = "1234567";
	int res;
	res = ft_strlen(str_len);
	printf("srt = %s\nlen = %d\n", str_len, res);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcpy ----  \n");
	char *src_cpy = "abc123456";
	char dest_cpy[ft_strlen(src_cpy) + 1];
	ft_strcpy(dest_cpy, src_cpy);
	printf("src  = %s\ndest = %s\n", src_cpy, dest_cpy);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcmp ----  \n");
	char	*s1 = "abcd";
	char	*s2 = "abcdef";
	int		diff;
	diff = ft_strcmp(s1, s2);
	printf("s1 = %s\ns2 = %s\ndiff = %d\n", s1, s2, diff);
	dprintf(1, "  -------------------  \n\n");

	int fd = open("file_to_read", O_RDWR);
	dprintf(1, "fd = %d\n\n", fd);

	// fd = 3;

	dprintf(1, "  ---- ft_write ----  \n");
	char *buffer = "123456789abcd\n";
	int size = ft_write(1, buffer, 5);
	dprintf(1, "\nsize = %d\n", size);
	dprintf(1, "errno = %d\n", errno);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_read ----  \n");
	char buf[100];
	size = ft_read(fd, buf, -1);
	dprintf(1, "buf = %s\nsize = %d\n", buf, size);
	dprintf(1, "errno = %d\n", errno);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strdup ----  \n");
	char *str = "0123456789";
	char *str_dup;
	str_dup = ft_strdup(str);
	dprintf(1, "str     = %s\nstr_dup = %s\n", str, str_dup);
	dprintf(1, "  -------------------  \n\n");
	free(str_dup);


	dprintf(1, "  ---- ft_list_size ----  \n");

	t_list	*elem0;
	t_list	*elem1;
	t_list	*elem2;
	t_list	*begin;
	t_list	*elem;
	int		lst_len;

	elem0 = malloc(sizeof(t_list));
	elem0->next = NULL;
	elem1 = malloc(sizeof(t_list));
	elem1->next = NULL;
	elem2 = malloc(sizeof(t_list));
	elem2->next = NULL;
	elem0->next = elem1;
	elem1->next = elem2;
	elem0->data = "abc";
	elem1->data = "def";
	elem2->data = "hij";
	begin = NULL;

	lst_len = ft_list_size(begin);
	dprintf(1, "lst_len = %d\n", lst_len);

	ft_list_push_front(&begin, "123");

	lst_len = ft_list_size(begin);
	dprintf(1, "lst_len = %d\n", lst_len);

	elem = begin;
	while (elem)
	{
		dprintf(1, "%s\n", elem->data);
		elem = elem->next;
	}

	return(0);
}