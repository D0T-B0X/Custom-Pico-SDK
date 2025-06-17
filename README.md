# Pico-SDK-DotBox

Welcome to my experimental project, **Pico-SDK-DotBox**. This is my personal attempt to build a basic hardware abstraction layer and supporting code for the Raspberry Pi Pico, inspired by the official [Pico SDK](https://github.com/raspberrypi/pico-sdk). The main goal here is to learn about embedded development, modular code organization, and what goes into making an SDK for the RP2040 microcontroller.

---

## What is this?

This repository is a starting point for me to explore how SDKs are structured and how hardware abstraction works on microcontrollers. I’m using CMake and the ARM GCC toolchain to get a feel for cross-compilation and reproducible builds. The code is intentionally simple and will probably evolve as I learn more.

---

## Features (so far)

- **Basic Hardware Abstraction:** I’m trying to separate hardware-specific code from the main application logic.
- **CMake Build System:** Using CMake to manage builds and project structure.
- **Pico SDK Integration:** The official SDK is included as a reference and for compatibility.
- **Cross-Platform:** Should work on Linux, macOS, or Windows (WSL recommended).
- **Learning Focus:** Everything here is for learning and experimentation.

---

## How to use

### Prerequisites

- Raspberry Pi Pico board
- [Pico SDK](https://github.com/raspberrypi/pico-sdk)
- ARM GCC toolchain (`arm-none-eabi-gcc`)
- CMake (version 3.13 or higher)
- Git

### Cloning

```bash
git clone https://github.com/D0T-B0X/Pico-SDK-DotBox.git
cd Pico-SDK-DotBox
git submodule update --init --recursive
```

### Building

```bash
- cmake -S . -B build
- cd make
- make
```

### Flashing

Copy the generated `.uf2` file to your Pico (in BOOTSEL mode), or use `picotool`:

```bash
picotool load your_project.uf2
```

---

## Contributing

This is mainly for my own learning, but if you have suggestions or feedback, feel free to open an issue or pull request. Just keep in mind this is a work in progress and very much a learning project.

---

## References

- [Raspberry Pi Pico SDK Documentation](https://raspberrypi.github.io/pico-sdk-doxygen/)
- [Getting Started with Raspberry Pi Pico](https://www.raspberrypi.com/documentation/microcontrollers/)
- [CMake Documentation](https://cmake.org/documentation/)

---

*This project is a work in progress and a personal learning exercise.*