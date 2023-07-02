# The compiler
CC = g++-12

# Compiler flags
CFLAGS = -std=c++20 -Wall -Wextra -Wpedantic -Wshadow -I src

# Object files directory
OBJDIR = bin

# Source files directory
SRCDIR = src

# Main files directory
MAINDIR = main

# Object files
_OBJ = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(wildcard $(SRCDIR)/*.cpp))

# Executables
EXE = $(patsubst $(MAINDIR)/%.cpp,%.exe,$(wildcard $(MAINDIR)/*.cpp))

# Rule to build object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) -c -o $@ $< $(CFLAGS)

# Rule to build executables
%.exe: $(MAINDIR)/%.cpp $(_OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

# Rule to build all
all: $(EXE)

# Rule to clean
clean:
	rm -f *.exe

.PHONY: all clean
