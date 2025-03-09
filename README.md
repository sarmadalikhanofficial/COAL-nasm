# COAL-NASM

This repository contains my **Computer Organization and Assembly Language (COAL)** classwork and practice codes written in **NASM (Netwide Assembler)**. It includes various assembly programs for learning and practicing low-level programming concepts.

## 📌 About
- This repo serves as a **collection of assembly programs** for understanding system architecture and low-level programming.
- Covers topics like **registers, memory operations, system calls, arithmetic operations, loops, and I/O handling**.
- Includes both **class assignments and personal practice programs**.

## 🚀 Getting Started
### Prerequisites
To run the NASM assembly programs, ensure you have the following installed:
- **NASM (Netwide Assembler)**
- **GCC (GNU Compiler Collection)** (for linking)
- A **Linux environment** (or WSL if using Windows)

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/sarmadalikhanofficial/COAL-nasm/tree/main
   cd COAL-nasm
   ```
2. **Install NASM (if not already installed)**:
   ```bash
   sudo apt update && sudo apt install nasm
   ```

## 📂 Directory Structure
```
COAL-nasm/
│-- classwork/      # Assembly programs from lectures
│-- practice/       # Self-practice codes
│-- README.md       # Project documentation
```

## ⚡ Running a NASM Program
1. **Assemble the code**:
   ```bash
   nasm -f elf32 filename.asm -o filename.o
   ```
2. **Link the object file**:
   ```bash
   ld -m elf_i386 filename.o -o filename
   ```
3. **Run the executable**:
   ```bash
   ./filename
   ```

## 🤝 Contributions
This is a personal learning repository, but if you want to contribute or discuss improvements, feel free to **open an issue** or **submit a pull request**.

## 📜 License
This repository is for educational purposes. Feel free to use the code for learning but provide proper credits if shared.

---

Happy Coding! 🚀

