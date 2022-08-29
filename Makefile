
CPPPARAMS 	= -m32
ASPARAMS  	= --32
LDPARAMS	= -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++ $(CPPPARAMS) -o $@ -c $<

%.o: %.s
	as $(ASPARAMS) -o $@ $<

aerokernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)