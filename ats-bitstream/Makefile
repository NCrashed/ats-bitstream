MKDIR   := mkdir
RMDIR   := rd /S /Q
PATSCC  := patscc
AR      := ar
BIN     := ./bin
OBJ     := ./obj
SRC     := ./DATS
SRCS    := $(wildcard $(SRC)/*.dats)
OBJS    := $(patsubst $(SRC)/%.dats,$(OBJ)/%.o,$(SRCS))
LIBNAME := bitstream
LIB     := $(BIN)/lib$(LIBNAME).a
CFLAGS  := -I$(PATSHOME)/contrib
LDFLAGS :=
TEST    := $(BIN)/test$(LIBNAME)
TESTSRC := ./test
TESTSRCS:= $(wildcard $(TESTSRC)/*.dats)

.PHONY: all run clean

all: $(LIB)

$(LIB): $(OBJS) | $(BIN)
	$(AR) rcs $@ $^

$(OBJ)/%.o: $(SRC)/%.dats | $(OBJ)
	$(PATSCC) $(CFLAGS) -c $< -o $@

$(BIN) $(OBJ):
	$(MKDIR) $@

test: $(TEST)
	$<

$(TEST): $(LIB) | $(BIN)
	$(PATSCC) $(CFLAGS) $(LDFLAGS) $(TESTSRCS) -o $@ -L$(BIN) -l$(LIBNAME)

clean:
	$(RMDIR) $(OBJ) $(BIN)
