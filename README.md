# SuperPI

Single-thread CPU benchmark based on Takuyo Ooura's FFT/AGM Pi calculation.

-----

## Build

### Make (gcc)

```sh
make all
```

Or directly:

```sh
gcc -O -funroll-loops -fomit-frame-pointer pi_fftcs.c fftsg_h.c -lm -o pi_css5
```

### CMake

```sh
cmake -S . -B build
cmake --build build
```

Compiler-appropriate flags are applied automatically. Verified toolchains:

- MSVC (`cl.exe`, Visual Studio 2026)
- GCC (MinGW / MSYS2 UCRT64)
- Clang (MSYS2 CLANG64)

### xmake

```sh
xmake f -m release
xmake
```

Switch toolchain:

```sh
xmake f --toolchain=msvc -c -m release
xmake f --toolchain=gcc -c -m release
xmake f --toolchain=clang -c -m release
```

-----

## Run

```sh
./pi_css5 $((1 << 20))     # Linux / Unix
pi_css5.exe 1048576        # Windows
```

The argument is the number of decimal digits to compute. It is rounded up to a power of two, and the result is written to `pi<digits>.txt`.
