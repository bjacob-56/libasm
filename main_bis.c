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
	printf("str = %s\nlen = %d\n", str_len, res);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcpy ----  \n");
	char *src_cpy = "abc123456";
	char dest_cpy[ft_strlen(src_cpy) + 1];
	ft_strcpy(dest_cpy, src_cpy);
	printf("src  = %s\ndest = %s\n", src_cpy, dest_cpy);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_strcmp ----  \n");
	char	*s1 = "023";
	char	*s2 = "0230";
	int		diff;
	diff = ft_strcmp(s1, s2);
	printf("s1 = %s\ns2 = %s\ndiff = %d\n", s1, s2, diff);
	dprintf(1, "  -------------------  \n\n");

	int fd = open("file_to_read", O_RDWR);
	dprintf(1, "fd = %d\n\n", fd);

	// fd = 3;

	dprintf(1, "  ---- ft_write ----  \n");
	char *buffer = "123456789abcd\n";
	int size = ft_write(-1, buffer, 5);
	dprintf(1, "\nsize = %d\n", size);
	dprintf(1, "errno = %d\n", errno);
	dprintf(1, "  -------------------  \n\n");

	dprintf(1, "  ---- ft_read ----  \n");
	char buf[100];
	size = ft_read(fd, buf, 3);
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

	dprintf(1, "  ---- ft_atoi_base ----  \n");
	char 	*str_nb = "   --+-1a5r45";
	char 	*base = "0123456789abcdef";
	int		atoi_res;
	atoi_res = ft_atoi_base(str_nb, base);
	dprintf(1, "str_nb = %s\nnb     = %d\n", str_nb, atoi_res);
	dprintf(1, "  -------------------  \n\n");




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

	begin = elem0;
	elem0->next = elem1;
	elem1->next = elem2;

	char *str_lst0 = "12711";
	char *str_lst1 = "12411";
	char *str_lst2 = "012311";

	elem0->data = str_lst0;
	elem1->data = str_lst1;
	elem2->data = str_lst2;


	lst_len = ft_list_size(begin);
	dprintf(1, "lst_len = %d\n", lst_len);

	ft_list_push_front(&begin, "1");

	lst_len = ft_list_size(begin);
	dprintf(1, "lst_len = %d\n", lst_len);


	ft_list_sort(&begin, &ft_strcmp);

	elem = begin;
	while (elem)
	{
		dprintf(1, "%s\n", elem->data);
		elem = elem->next;
	}

	dprintf(1, "  -------------------  \n\n");

	return(0);
}