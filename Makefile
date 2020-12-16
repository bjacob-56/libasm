SRCS	=   hello_world.s ft_strlen.s ft_strcpy.s

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
