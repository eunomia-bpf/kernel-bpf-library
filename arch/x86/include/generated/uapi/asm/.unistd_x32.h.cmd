savedcmd_arch/x86/include/generated/uapi/asm/unistd_x32.h := sh ./scripts/syscallhdr.sh --abis common,x32 --emit-nr --offset __X32_SYSCALL_BIT  arch/x86/entry/syscalls/syscall_64.tbl arch/x86/include/generated/uapi/asm/unistd_x32.h
