; Task #1: NASM Compilation Command Explanation
; Command: nasm abc.asm -o abc.com

; Explanation of each component:

; 1. nasm
;    - NASM (Netwide Assembler) is the assembler program
;    - It's a command-line tool that converts assembly language code into machine code
;    - It's one of the most popular assemblers for x86 architecture

; 2. abc.asm
;    - This is the input file containing the assembly language code
;    - .asm is the standard extension for assembly language source files
;    - The file contains human-readable assembly instructions

; 3. -o abc.com
;    - -o is the output option flag that specifies the name of the output file
;    - abc.com is the name of the output file
;    - .com extension indicates it's a DOS/Windows command file
;    - The output file contains the machine code that can be executed directly

; The complete command:
; nasm abc.asm -o abc.com
; This command tells NASM to:
; 1. Read the assembly code from abc.asm
; 2. Assemble it into machine code
; 3. Save the result as abc.com

; Note: The .com format is a simple executable format used in DOS
; It's limited to 64KB in size and is loaded directly into memory
; This format is suitable for small programs and learning purposes 