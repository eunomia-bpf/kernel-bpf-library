# SPDX-License-Identifier: GPL-2.0
LINUX_CFLAGS :=  \
	-nostdinc \
	-isystem $(shell $(LLVM_CONFIG) --prefix)/lib/clang/$(shell $(LLVM_CONFIG) --version)/include \
	-Iarch/riscv/include \
	-Iarch/riscv/include/generated \
	-Iinclude \
	-Iarch/riscv/include/uapi \
	-Iarch/riscv/include/generated/uapi \
	-Iinclude/uapi \
	-Iinclude/generated/uapi \
	-include include/linux/kconfig.h \
	-include include/linux/compiler_types.h \
	-I. \
	-D__KERNEL__ \
	-DKBUILD_MODNAME='"test"' \
	-Qunused-arguments \
	-mno-global-merge \
	-fno-omit-frame-pointer \
	-fno-strict-overflow \
	-fshort-wchar \
	-fno-strict-aliasing \
	-fno-PIE \
	-fno-common \
	-fno-delete-null-pointer-checks \
	-fno-optimize-sibling-calls \
	-fno-stack-check \
	-std=gnu89 --target=riscv64-linux-gnu -mabi=lp64 -march=rv64imac \
	-Wno-gnu \
	-O2 \

LINUX_CFLAGS_EXTRA = $(LINUX_CFLAGS) -fno-PIE -ffunction-sections -fdata-sections -fno-PIC

%.o: %.c arch/riscv/net/bpf_jit.h
	gcc $(LINUX_CFLAGS_EXTRA) -mcmodel=medany -g -c $< -o $@

%.ll: %.c arch/riscv/net/bpf_jit.h
	gcc $(LINUX_CFLAGS_EXTRA) -S -emit-llvm $< -o $@

phony_explicit:

.PHONY: verify-all gen gen-llvm phony_explicit
