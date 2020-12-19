SRCS	=   ft_strlen.s ft_strcpy.s ft_strcmp.s \
			ft_write.s ft_read.s \
			ft_strdup.s \
			ft_list_push_front.s ft_list_size.s ft_list_sort.s

OBJS = ${SRCS:.s=.o}

NAME = libasm.a
RM ?= rm -f
NASM= nasm
FLAGS = -f macho64


.s.o:
	$(NASM) $(FLAGS) -s $< -o $@

$(NAME):	${OBJS}
	ar rcs ${NAME} ${OBJS}

$(OBJS) : libasm.h

all : 		${NAME}

clean :
	${RM} ${OBJS}

fclean : 	clean
	${RM} ${NAME}

re :		fclean all

.PHONY: all clean fclean re
