# kernel-bpf-library: a standalone eBPF runtime and verifier

This is a standalone eBPF runtime and verifier, extracted from the Linux kernel. It can be compile and run in userspace with no kernel dependencies.

The current version is based on the Linux kernel `linux-watchdog-6.5-rc2` and commit `3f01e9fed`.

## Features

- Minimal changes to the original kernel code, No modification to the kernel verfiier, jit, and interpreter.
- Use CI to automatically sync with the latest kernel eBPF runtime
- Support both JIT and interpreter modes
- support maps, helpers, and BTF CO-RE
- support kernel verifier

## Build

```sh
make
```
