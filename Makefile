##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Make for asm_minilibc
##

NASM		= nasm -f elf64

CC		= ld

SRC		= src/strlen.asm        	\
		  src/strchr.asm        	\
		  src/memset.asm		\
		  src/memcpy.asm        	\
		  src/strcmp.asm        	\
		  src/strncmp.asm       	\
		  src/strcasecmp.asm    	\
		  src/rindex.asm

OBJ		= $(SRC:.asm=.o)

NAME		= libasm.so

all:		$(NAME)

$(NAME):	$(OBJ)
		@$(CC) -shared -fPIC -o $(NAME) $(OBJ)
		@echo "[libasm.so] compiled !"

%.o:		%.asm
		@$(NASM) -o $@ $<

clean:
		@rm -f $(OBJ)
		@echo "Object files deleted"

fclean:		clean
		@rm -f $(NAME)
		@echo "[libasm.so] deleted"

re:             fclean all
