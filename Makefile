SRCS	=   ft_strlen.s ft_strcpy.s ft_strcmp.s \
			ft_write.s ft_read.s \
			ft_strdup.s

SRCS_bonus	=	ft_atoi_base_bonus.s \
				ft_list_push_front_bonus.s ft_list_size_bonus.s ft_list_sort_bonus.s

OBJS = $(SRCS:.s=.o)

OBJS_bonus = $(SRCS_bonus:.s=.o)

NAME = libasm.a
RM ?= rm -f
NASM= nasm
FLAGS = -f macho64


.s.o:
	$(NASM) $(FLAGS) -s $< -o $@

$(NAME):	$(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus:		$(OBJS_bonus) $(NAME)
	ar rcs $(NAME) $(OBJS_bonus)

$(OBJS): libasm.h

$(OBJS_bonus): libasm.h

all: 		$(NAME) bonus

clean:
	$(RM) $(OBJS) $(OBJS_bonus)

fclean: 	clean
	$(RM) $(NAME)

re:		fclean all

.PHONY: all clean fclean re
