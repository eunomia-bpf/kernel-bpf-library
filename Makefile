# SPDX-License-Identifier: GPL-2.0
LINUX_CFLAGS :=  \
	-nostdinc \
	-isystem $(shell $(LLVM_CONFIG) --prefix)/lib/clang/$(shell $(LLVM_CONFIG) --version)/include \
	-Iarch/x86/include \
	-Iarch/x86/include/generated \
	-Iarch/x86/include/generated/uapi \
	-Iarch/x86/include/uapi \
	-Iinclude \
	-Iinclude/uapi \
	-Iinclude/generated/uapi \
	-include include/linux/kconfig.h \
	-include include/linux/compiler_types.h \
	-I. \
	-D__KERNEL__ \
	-DKBUILD_MODNAME='"test"' \
	-fno-omit-frame-pointer \
	-fno-strict-overflow \
	-fshort-wchar \
	-fno-strict-aliasing \
	-fPIE \
	-fno-common \
	-fno-delete-null-pointer-checks \
	-fno-optimize-sibling-calls \
	-fno-stack-check \
	-std=gnu99 \
	-Wno-gnu \
	-O2 \

LINUX_CONFIG_DEFINES := \
	-DCC_USING_FENTRY \

LINUX_CFLAGS_EXTRA = $(LINUX_CFLAGS) $(LINUX_CONFIG_DEFINES) -fno-PIE -ffunction-sections -fdata-sections -fno-PIC

# Find all the C source files in the current directory
SOURCES = $(wildcard src/bpf/*.c)
# Object files are the .c files, but with .o extensions instead
OBJECTS = $(SOURCES:.c=.o)

TARGET = kernel-bpf-lib
# Default target
all: $(TARGET)

# Link the target
$(TARGET): $(OBJECTS)
	gcc $(LINUX_CFLAGS_EXTRA) $(OBJECTS) -o $(TARGET)

%.o: %.c
	gcc $(LINUX_CFLAGS_EXTRA) -g -c $< -o $@

x86: 

clean:
	rm $(TARGET) $(OBJECTS)

.PHONY: x86 all clean
