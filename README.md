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
- ✅ **DOSBox** 
- ✅ **Git** (optional, for cloning the repository)
- ✅ [**MARS** (Original MIPS Assembler and Runtime Simulator)](https://github.com/dpetersanderson/MARS)
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
```


# Common MIPS Assembly Instructions

```bash
| Instruction | Syntax                | Description                                                                 |
|-------------|-----------------------|-----------------------------------------------------------------------------|
| `li`        | `li $reg, imm`        | **Load Immediate:** Loads an immediate (constant) value into a register.<br>Example: `li $t0, 5` puts 5 in `$t0`. |
| `la`        | `la $reg, label`      | **Load Address:** Loads the address of a label (variable or array) into a register.<br>Example: `la $t1, array` puts the address of `array` in `$t1`. |
| `lw`        | `lw $reg, offset($base)` | **Load Word:** Loads a 32-bit word from memory into a register.<br>Example: `lw $t2, 0($t1)` loads the word at address in `$t1` into `$t2`. |
| `sw`        | `sw $reg, offset($base)` | **Store Word:** Stores a 32-bit word from a register into memory.<br>Example: `sw $t2, 0($t1)` stores `$t2` at address in `$t1`. |
| `add`       | `add $d, $s, $t`      | **Add:** Adds two registers and stores the result in a third.<br>Example: `add $t0, $t1, $t2` sets `$t0 = $t1 + $t2`. |
| `addi`      | `addi $d, $s, imm`    | **Add Immediate:** Adds a register and an immediate value.<br>Example: `addi $t0, $t1, 1` sets `$t0 = $t1 + 1`. |
| `move`      | `move $d, $s`         | **Move:** Copies the value from one register to another.<br>Example: `move $a0, $t0` copies `$t0` to `$a0`. |
| `bgt`       | `bgt $s, $t, label`   | **Branch if Greater Than:** Jumps to label if `$s > $t`.<br>Example: `bgt $t0, $t1, end` jumps to `end` if `$t0 > $t1`. |
| `j`         | `j label`             | **Jump:** Unconditional jump to a label.<br>Example: `j loop` jumps to `loop`. |
| `syscall`   | `syscall`             | **System Call:** Performs an OS service (print, read, exit, etc.) based on value in `$v0`. |

```
---

## Example Usage

```nasm
li $t0, 10         # Load 10 into $t0
la $t1, array      # Load address of array into $t1
lw $t2, 0($t1)     # Load value from array into $t2
add $t3, $t0, $t2  # Add $t0 and $t2, store in $t3
sw $t3, 4($t1)     # Store $t3 into array[1]
```
