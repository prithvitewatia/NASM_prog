all: add.out counter.out factorial.out fibonacci.out fizzbuzz.out

add.out: add.o
	ld -m elf_i386 add.o -o add.out
add.o: add.asm
	nasm -f elf add.asm

counter.out: counter.o
	ld -m elf_i386 counter.o -o counter.out
counter.o: counter.asm
	nasm -f elf counter.asm

factorial.out: factorial.o
	ld -m elf_i386 factorial.o -o factorial.out
factorial.o: factorial.asm
	nasm -f elf factorial.asm

fibonacci.out: fibonacci.o
	ld -m elf_i386 fibonacci.o -o fibonacci.out
fibonacci.o: fibonacci.asm
	nasm -f elf fibonacci.asm

fizzbuzz.out: fizzbuzz.o
	ld -m elf_i386 fizzbuzz.o -o fizzbuzz.out
fizzbuzz.o: fizzbuzz.asm
	nasm -f elf fizzbuzz.asm

clean:
	rm *.out
	rm *.o