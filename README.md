# Scheme-to-x86-64 Compiler

This project is an OCaml implementation of a Scheme compiler that emits
64-bit x86 assembly. It includes the Scheme runtime support files needed by
the code generator.

## Repository Contents

- `compiler.ml` - reader, tag parser, semantic analysis, and code generation.
- `pc.ml` - parser-combinator support used by the reader.
- `init.scm` - Scheme definitions loaded before user programs.
- `prologue-1.asm`, `prologue-2.asm`, `epilogue.asm` - runtime assembly.
- `compile.ml` - command-line entry point for compiling Scheme files.
- `makefile` - NASM/GCC build rules for generated assembly.
- `examples/` - small input programs.

## Prerequisites

The compiler expects a Unix-like build environment with:

- OCaml
- GNU Make
- NASM
- GCC with 64-bit support

On Windows, the simplest setup is usually WSL.

## Usage

Compile a Scheme source file to assembly:

```sh
ocaml compile.ml examples/hello.scm build/hello.asm
```

Assemble and link the generated file:

```sh
make build/hello
```

Run it:

```sh
./build/hello
```

The compiler can also be loaded from the OCaml toplevel:

```ocaml
#use "compiler.ml";;
Code_Generation.compile_scheme_file "examples/hello.scm" "build/hello.asm";;
```
