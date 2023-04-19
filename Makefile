# ============================================================================ #
#                       Compiler and flags                                     #
# ============================================================================ #
CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic

# ============================================================================ #
#                             Source files                                     #
# ============================================================================ #
SRC = $(wildcard *.c)

# ============================================================================ #
#                             Object files                                     #
# ============================================================================ #
OBJ = $(SRC:.c=.o)

# ============================================================================ #
#                        Output executable                                     #
# ============================================================================ #
EXEC = hsh
RM = rm -f
FLAGEDIT = -o
FLAGEXC = $@
FLAGEXO = $^

# ============================================================================ #
#                                    BETTY                                     #
# ============================================================================ #
BETTY = betty

# ============================================================================ #
#                                VALGRIND                                      #
# ============================================================================ #
VALGRIND = valgrind
VALGRIND_FLAG =  --leak-check=full
# ============================================================================ #
#                                   COLOR                                      #
# ============================================================================ #

CL_BOLD	 = \e[1m
CL_DIM	= \e[2m
CL_UDLINE = \e[4m

NO_COLOR = \e[0m

BG_TEXT = \e[48;2;45;55;72m
BG_BLACK = \e[48;2;30;31;33m

FG_WHITE = $(NO_COLOR)\e[0;37m
FG_TEXT = $(NO_COLOR)\e[38;2;189;147;249m
FG_TEXT_PRIMARY = $(NO_COLOR)$(CL_BOLD)\e[38;2;255;121;198m

LF = \e[1K\r$(NO_COLOR)
CRLF= \n$(LF)
# ============================================================================ #
#                                  TARGET                                      #
# ============================================================================ #

all: $(EXEC)


$(EXEC): $(OBJ)
	@$(CC) $(CFLAGS) $(FLAGEDIT) $(FLAGEXC) $(FLAGEXO)
	@echo "📚 Create $(EXEC)!"
	@printf "$(LF)🎉 $(FG_TEXT)Successfully created $(FG_TEXT_PRIMARY)$(EXEC) -> MakeFile by zrdouane!\n"
    
    
%.o: %.c
	@printf "$(LF)🚧 $(FG_TEXT)Create $(FG_TEXT_PRIMARY)$@ $(FG_TEXT)from $(FG_TEXT_PRIMARY)$< \n"
	@$(CC) $(CFLAGS) -c $< -o $@


clean:
	@$(RM) $(OBJ) $(EXEC)
	@printf "$(LF)🧹 $(FG_TEXT)Cleaning $(FG_TEXT_PRIMARY)$(EXEC) Object files...  -> MakeFile by zrdouane!\n"

betty:
	@printf "$(LF)🔎 $(FG_TEXT)Checking code style with $(FG_TEXT_PRIMARY)betty $(FG_TEXT)...\n"
	@$(foreach file,$(SRC),$(BETTY) $(file) && printf "$(FG_TEXT_PRIMARY)$(FG_TEXT)$(file)\n" || printf "$(FG_TEXT_ERROR)✘$(NO_COLOR) $(file)\n";)
	@printf "$(LF)🔎 $(FG_TEXT_PRIMARY)Finished checking code style! -> MakeFile by zrdouane!\n"

valgrind: $(EXEC)
	$(VALGRIND) $(VALGRIND_FLAG) ./$(EXEC) by zrdouane
