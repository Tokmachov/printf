# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mac <sjolynn@student.21-school.ru>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/28 19:18:09 by mac               #+#    #+#              #
#    Updated: 2020/05/28 19:18:11 by mac              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRCS = ft_printf.c \
	make_printable_strs.c \
		split_to_comps.c \
		convert_to_printables.c \
		free_comps.c \
		move_ptr_past_comp.c \
		get_comp.c \
		convert_to_printable.c \
		make_printable_from_specs_comp.c \
		parse_specs.c convert_specs_to_str.c \
		parse_flag.c \
		parse_width.c \
		parse_prescision.c \
		parse_arg.c \
		parse_c_arg.c \
		parse_s_arg.c \
		parse_int_arg.c \
		parse_ll_arg.c \
		parse_p_arg.c \
		parse_u_arg.c \
		parse_x_arg.c \
		parse_capital_x_arg.c \
		parse_func_for_id.c \
		init_printable.c \
		arg_applaying_prescision.c \
		arg_s_applying_prescision.c \
		arg_p_applying_prescision.c \
		arg_int_applying_prescision.c \
		arg_formatted.c \
		width_filled_with_padding_and_int_arg.c \
		width_filled_with_padding_and_s_arg.c \
		width_filled_with_padding_and_p_arg.c \
		width_filled_with_padding_and_c_arg.c \
		right_aligned_str.c \
		left_aligned_str.c \
		calc_padding_len.c \
	count_printed_chrs.c \
	print.c \
	free_printables.c \
	is_flag.c is_arg_type.c  ft_itoa_hex.c ft_itoa_ll.c \
	make_filled_str.c   \
	ft_itoa_u.c ft_itoa_p.c \
	  

OBJS = $(SRCS:.c=.o)

LIBFT = libft/libft.a

LIBFT_NAME = libft.a

LIBFT_SRCS = $(wildcard libft/*.c)
LIBFT_OBJS = $(LIBFT_SRCS:.c=.o)
LIBFT_HEADER = libft/libft.h

HEADER = ft_printf.h

CC = gcc

CFLAGS = -Wall -Wextra -Werror -c -g

.PHONY = all clean fclean re create_libt

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT_OBJS) $(LIBFT_SRCS) $(LIBFT_HEADER)
	make -C libft all
	cp $(LIBFT) .
	mv $(LIBFT_NAME) $(NAME)
	ar rc $(NAME) $(OBJS)

$(OBJS): $(SRCS) $(HEADER)
	$(CC) $(CFLAGS) $(SRCS) -I.
	
clean:
	rm -f $(OBJS)
	make -C libft clean
fclean: clean
	rm -f $(NAME)
	make -C libft fclean
re: fclean all
