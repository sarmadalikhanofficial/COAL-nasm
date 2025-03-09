; syntax

; The data section is used for declaring initialized data or constants. This data does not change at runtime. You can declare various constant values, file names, or buffer size, etc., in this section.
; The syntax for declaring data section is
section.data


; The bss section is used for declaring variables. 
; The syntax for declaring bss section is
section.bss


; The text section is used for keeping the actual code. This section must begin with the declaration global _start, which tells the kernel where the program execution begins.
; The syntax for declaring text section is
section.text
   global _start
_start:


; Assembly language comment begins with a semicolon (;). 
; It may contain any printable character including blank. It can appear on a line by itself, like −
; This program displays a message on screen
; or, on the same line along with an instruction, like −
add eax, ebx     ; adds ebx to eax


; Assembly Language Statements
; Assembly language programs consist of three types of statements −
; Executable instructions or instructions,
; Assembler directives or pseudo-ops, and
; Macros.

