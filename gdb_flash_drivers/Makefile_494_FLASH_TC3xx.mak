# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += 
CPP_SRCS = flash_TC3xx.c 

OBJS +=flash_TC3xx.o 

BININSTALLROOT=/e/AURIX_MINGW_INSTALL/tricore_494_mingw/bin/
CC=$(BININSTALLROOT)tricore-elf-gcc.exe
CPP=$(BININSTALLROOT)tricore-elf-gcc.exe
AS=$(BININSTALLROOT)tricore-elf-as.exe
LD=$(BININSTALLROOT)tricore-elf-ld.exe
AR=$(BININSTALLROOT)tricore-elf-ar.exe
OBJDUMP=$(BININSTALLROOT)tricore-elf-objdump.exe
OBJCOPY=$(BININSTALLROOT)tricore-elf-objcopy.exe

CC_INCLUDES =  
#TC1.6
CC_FLAGS = -v -Wall -g3 -O2 -fno-peephole2 -fno-common -fno-short-enums -mtc161 -fsingle-precision-constant \
           $(CC_INCLUDES) -save-temps -nostartfiles -nodefaultlibs -nostdlib -c
AS_FLAGS = -mtc161
LINKER_FLAGS= -v --mcpu=tc161 -T flash_TC3xx.ld -nostartfiles -nostdlib -nodefaultlibs
LIBS= 

LIBRARY_PATH= 

EXECUTEABLE= flash_TC3xx.elf
SREC= flash_TC3xx.sre
IHEX= flash_TC3xx.hex
DISASM= DisAsm_flash_TC3xx.Lst


$(EXECUTEABLE): $(OBJS) flash_TC3XX.ld 
	@echo 'Building target: $@'
	@echo 'Invoking: Linker'
	$(LD) $(LINKER_FLAGS) -o $(EXECUTEABLE) $(LIBRARY_PATH) $(LIBS) $(OBJS) $(ADDOBJS) $(LIBS) 
	$(OBJDUMP) -d $(EXECUTEABLE) >$(DISASM)
	$(OBJCOPY) $(EXECUTEABLE) -O srec $(SREC)
	$(OBJCOPY) $(EXECUTEABLE) -O ihex $(IHEX)
	@echo 'Finished building target: $@'
	@echo ' '



flash_TC3xx.o: flash_TC3xx.c
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(CC) -S $(CC_FLAGS) -c $<  
	$(AS) $(AS_FLAGS) flash_TC3xx.s  -o flash_TC3xx.o
	@echo 'Finished building: $<'
	@echo ' '



clean:
	-rm -f flash_TC3xx.elf
	-rm -f flash_TC3xx.o
	-rm -f flash_TC3xx.i
	-rm -f flash_TC3xx.sre
	-rm -f flash_TC3xx.hex
	
