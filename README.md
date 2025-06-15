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
| Instruction | Syntax                   | Description                                                                 |
|-------------|--------------------------|-----------------------------------------------------------------------------|
| `li`        | `li $reg, imm`           | **Load Immediate:** Loads an immediate (constant) value into a register.<br>Example: `li $t0, 5` puts 5 in `$t0`. |
| `la`        | `la $reg, label`         | **Load Address:** Loads the address of a label (variable or array) into a register.<br>Example: `la $t1, array` puts the address of `array` in `$t1`. |
| `lw`        | `lw $reg, offset($base)` | **Load Word:** Loads a 32-bit word from memory into a register.<br>Example: `lw $t2, 0($t1)` loads the word at address in `$t1` into `$t2`. |
| `sw`        | `sw $reg, offset($base)` | **Store Word:** Stores a 32-bit word from a register into memory.<br>Example: `sw $t2, 0($t1)` stores `$t2` at address in `$t1`. |
| `add`       | `add $d, $s, $t`         | **Add:** Adds two registers and stores the result in a third.<br>Example: `add $t0, $t1, $t2` sets `$t0 = $t1 + $t2`. |
| `addi`      | `addi $d, $s, imm`       | **Add Immediate:** Adds a register and an immediate value.<br>Example: `addi $t0, $t1, 1` sets `$t0 = $t1 + 1`. |
| `move`      | `move $d, $s`            | **Move:** Copies the value from one register to another.<br>Example: `move $a0, $t0` copies `$t0` to `$a0`. |
| `bgt`       | `bgt $s, $t, label`      | **Branch if Greater Than:** Jumps to label if `$s > $t`.<br>Example: `bgt $t0, $t1, end` jumps to `end` if `$t0 > $t1`. |
| `j`         | `j label`                | **Jump:** Unconditional jump to a label.<br>Example: `j loop` jumps to `loop`. |
| `syscall`   | `syscall`                | **System Call:** Performs an OS service (print, read, exit, etc.) based on value in `$v0`. |

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
---

# 📘 MIPS Assembly I/O Reference – Syscalls Explained

This guide helps you understand how **syscall codes** work in MIPS Assembly, especially for handling input/output operations like reading floats, printing strings, and exiting the program.

---

## 🧠 What Are Syscalls?

Syscalls (system calls) let your MIPS program **interact with the system** — such as printing to the console, taking input, or terminating the program.

To perform a syscall:
1. Load the syscall code into `$v0`
2. Set any required input in the correct register(s)
3. Use the `syscall` instruction to execute

---

## 💬 Interacting with the user (input/output) using syscalls
```
$v0 = tells what operation you want (e.g., print, read, exit)
$a0 = where you put values like strings for printing or buffers for input
$a1 = used for string input to define max length
$f0, $f2 = registers for float values (input/output)
syscall = tells the system to do the action you set up
```

---

## 🔢 Common Syscall Codes

| Code (`$v0`) | Operation          | Input Register(s)     | Output Register(s)  | Description                         |
|--------------|--------------------|------------------------|---------------------|-------------------------------------|
| `1`          | Print Integer      | `$a0`                  | —                   | Prints an integer to console        |
| `2`          | Print Float        | `$f12`                 | —                   | Prints a float to console           |
| `4`          | Print String       | `$a0`                  | —                   | Prints a null-terminated string     |
| `5`          | Read Integer       | —                      | `$v0`               | Reads an integer from user          |
| `6`          | Read Float         | —                      | `$f0`               | Reads a float from user             |
| `8`          | Read String        | `$a0 = buffer`, `$a1`  | —                   | Reads string (up to N characters)   |
| `10`         | Exit Program       | —                      | —                   | Ends the program                    |

---

## 🔄 Input Example: Read Float

```asm
li $v0, 6         # Syscall to read float
syscall
mov.s $f2, $f0    # Save float from $f0 to $f2
```

✅ Accepts float input like `3.14`, `7.0`, etc.

---

## 🖨 Output Example: Print Float

```asm
li $v0, 2         # Syscall to print float
mov.s $f12, $f2   # Move float to $f12
syscall
```

✅ Prints the float value stored in `$f2`

---

## ⚠️ Note: Using `li $v0, 5` Instead of `6`

```asm
li $v0, 5
syscall
move $t0, $v0     # Read an integer into $t0
```

- ✅ Works **only for integer input** like `42`
- ❌ **Fails for float input** like `4.5` (decimal ignored or program crash)

👉 Always use `li $v0, 6` when you need to read float input.

---

## 🧾 Input Example: Read String

```asm
.data
buffer: .space 100

.text
li $v0, 8          # Syscall to read string
la $a0, buffer     # Buffer to store the string
li $a1, 100        # Max characters to read
syscall
```

✅ Reads a string of up to 99 characters (+1 for null terminator)

---

## 📌 Common Print Templates

### ✅ Print a String:
```asm
li $v0, 4
la $a0, yourLabel
syscall
```

### ✅ Print an Integer:
```asm
li $v0, 1
li $a0, 42
syscall
```

### ✅ Print a Float:
```asm
li $v0, 2
li.s $f12, 4.5
syscall
```

---

## ✅ Best Practices

- Use **correct syscall codes** for correct data types
- Always load string addresses using `la $a0, label`
- For reading strings, make sure to `.space` enough memory
- Use:
  - `$f0`, `$f12` → for floats  
  - `$a0`, `$v0` → for ints and strings
  - `$a1` → for string input length

---

