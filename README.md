# 🖥️ COAL-NASM (Computer Organization & Assembly Language)

This repository contains **COAL (Computer Organization and Assembly Language)** lab work and assignments written in **NASM Assembly Language**. As the **Class Representative (CR)**, I’ve organized this repo to help classmates easily access and understand the core concepts of low-level programming.

---

## 📌 About
- Covers **Assembly Language programs using NASM** on x86 architecture.
- Includes **lab assignments, class exercises, and extra practice programs**.
- Helps students understand **registers, memory, I/O, loops, strings, and arithmetic operations** in Assembly.

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the following installed on your system:

- ✅ [**NASM** (Netwide Assembler)](https://www.nasm.us/)
- ✅ [**DOSBox** 
- ✅ **Git** (optional, for cloning the repository)
- ✅ [**MARS** (MARS (original) MIPS Assembler and Runtime Simulator)](https://github.com/dpetersanderson/MARS)
---

### 🖥️ Run NASM Programs Using DOSBox

> 💡 These steps assume your `.ASM` files are located in `C:\assembly`.

#### Step-by-step Guide:

```bash
Step 1: mount c c:\assembly        # Mount your folder as C drive
Step 2: c:                         # Switch to C drive
Step 3: dir                        # List files in directory
Step 4: nasm filename.asm -o filename.com   # Compile ASM to .COM
Step 5: afd filename.com          # Run using AFD (Assembler & Debugger), 
Step 6: Press F1 to Load & Execute
