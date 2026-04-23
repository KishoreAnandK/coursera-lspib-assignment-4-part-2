override CROSS_COMPILE:=$(CROSS_COMPILE)gcc
CFLAGS:=-g -Wall
SOURCES:=writer.c
TARGET:=writer
TARGET_OBJS:=writer.o

.PHONY: all
all: $(TARGET)

$(TARGET): $(TARGET_OBJS) $(SOURCES)
	$(CROSS_COMPILE) $(CFLAGS) $(TARGET_OBJS) -o $(TARGET)

%.o: %.c
	$(CROSS_COMPILE) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET_OBJS) $(TARGET)

