#include "libasm.h"

void	ft_printf_list(t_list *begin)
{
	int	lst_len;

	lst_len = ft_list_size(begin);
	printf("--> print list __ size = %d\n", lst_len);
	while (begin)
	{
		printf("%s\n", begin->data);
		begin = begin->next;
	}
	printf("\n");
}

int main(void)
{
	int	test_strlen;
	int	test_strcpy;
	int	test_strcmp;
	int	test_write;
	int	test_read;
	int	test_strdup;
	int	fd;
	int	test_atoi_base;
	int	test_list;

	test_strlen = 1;
	test_strcpy = 1;
	test_strcmp = 1;
	test_write = 1;
	test_read = 1;
	test_strdup = 1;

	test_atoi_base = 1;
	test_list = 1;

	printf("\n======================  MANDATORY PART  ======================\n");

	if (test_strlen)
	{
		printf("\n----------------  ft_strlen  ----------------\n");
		char	*str_l = "1234567";

		printf("str = %s\nlen = %d\n", str_l, ft_strlen(str_l));
		printf("---------------------------------------------\n\n\n");
	}

	if (test_strcpy)
	{
		printf("----------------  ft_strcpy  ----------------\n");
		char	str_cpy_dest[30];
		char	*str_cpy_src = "1234567";

		printf("src = %s\ncpy = %s\n", str_cpy_src, ft_strcpy(str_cpy_dest, str_cpy_src));
		printf("---------------------------------------------\n\n\n");
	}

	if (test_strcmp)
	{
		printf("----------------  ft_strcmp  ----------------\n");
		char	*str_cmp_s1 = "1234";
		char	*str_cmp_s2 = "1234";

		printf("s1 = %s\ns2 = %s\ncmp = %d\n", str_cmp_s1, str_cmp_s2, ft_strcmp(str_cmp_s1, str_cmp_s2));
		printf("---------------------------------------------\n\n\n");
	}


	if (test_write)
	{
		// fd = open("file_to_read", O_RDWR);
		fd = 1;

		printf("----------------  ft_write  ----------------\n");
		char	*str_write = "123456789";
		int		nb_write;

		nb_write = ft_write(fd, str_write, 7);
		printf("\nnb_write = %d\nerrno = %d\n", nb_write, errno);
		printf("---------------------------------------------\n\n\n");

		// close(fd);
	}

	if (test_read)
	{
		// fd = open("file_to_read", O_RDWR);
		fd = 1;

		printf("----------------  ft_read  ----------------\n");
		char	str_read[50];
		int		nb_read;

		str_read[0] = 0;
		nb_read = ft_read(fd, str_read, 20);
		str_read[nb_read] = 0;
		printf("str_read = %s\nnb_read = %d\nerrno = %d\n", str_read, nb_read, errno);
		printf("---------------------------------------------\n\n\n");

		// close(fd);
	}

	if (test_strdup)
	{
		printf("----------------  ft_strdup  ----------------\n");
		char	*str_dup_dest;
		char	*str_dup_src = "1234567";

		str_dup_dest = ft_strdup(str_dup_src);
		printf("src = %s\ndup = %s\n", str_dup_src, str_dup_dest);

		free(str_dup_dest);
		printf("---------------------------------------------\n");
	}

	printf("\n==============================================================\n\n\n");



	printf("\n========================  BONUS PART  ========================\n\n");

	if (test_atoi_base)
	{
		printf("----------------  ft_atoi_base  ----------------\n");
		char	*str_atoi_nb = "   --+-1a5r45";
		char	*str_atoi_base = "0123456789abcdef";
		int		atoi_nb;

		atoi_nb = ft_atoi_base(str_atoi_nb, str_atoi_base);
		printf("nb   = |%s|\nbase = |%s|\nres  = %d\n", str_atoi_nb, str_atoi_base, atoi_nb);

		printf("---------------------------------------------\n\n");
	}

	t_list	*elem0;
	t_list	*elem1;
	t_list	*elem2;
	t_list	*begin;
	t_list	*elem;

	elem0 = malloc(sizeof(t_list));
	elem0->next = NULL;
	elem1 = malloc(sizeof(t_list));
	elem1->next = NULL;
	elem2 = malloc(sizeof(t_list));
	elem2->next = NULL;

	begin = elem0;
	elem0->next = elem1;
	elem1->next = elem2;

	char *str_lst0 = "124";
	char *str_lst1 = "12";
	char *str_lst2 = "0123";

	elem0->data = str_lst0;
	elem1->data = str_lst1;
	elem2->data = str_lst2;

	if (test_list)
	{
		printf("----------------  ft_list  ----------------\n");
		char	*str_lst_push = "234";

		ft_printf_list(begin);

		printf(">>> push_front %s <<<\n", str_lst_push);

		ft_list_push_front(&begin, str_lst_push);
		ft_printf_list(begin);

		printf(">>> sort_list <<<\n");

		ft_list_sort(&begin, ft_strcmp);
		ft_printf_list(begin);
		printf("---------------------------------------------\n");
	}

	printf("\n==============================================================\n");

}