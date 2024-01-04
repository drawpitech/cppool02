##
## EPITECH PROJECT, 2024
## cpppool02
## File description:
## Makefile
##

HC := ghc

NAME := doop

# ↓ Source files
SRC := DoOp.hs

# ↓ Objects
BUILD_DIR := .build
OBJ := $(SRC:%.hs=$(BUILD_DIR)/%.o)

all: $(NAME)

.PHONY: all

$(BUILD_DIR)/%.o: %.hs
	@ mkdir -p $(BUILD_DIR)
	$(HC) -o $@ -c -O $<

$(NAME): $(OBJ)
	$(HC) -o $@ $(OBJ)

.PHONY: $(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) -r $(BUILD_DIR)

.PHONY: clean fclean

re: fclean
	$(MAKE) -C .
