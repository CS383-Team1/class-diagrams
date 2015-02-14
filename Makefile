UMLCC = java -jar bin/plantuml.jar
CFLAGS = -tpng
SRC := $(wildcard *.uml)
SRC := $(SRC) $(wildcard */*.uml)
OBJ := $(patsubst %.uml, %.png, $(SRC))

.PHONY : all clean rebuild

all : $(OBJ)

%.png : %.uml
	$(UMLCC) $(CFLAGS) $^

clean : 
	\rm -f $(OBJ)

rebuild : 
	make clean
	make all
