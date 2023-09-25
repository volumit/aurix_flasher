################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/flash_tool_ihex.cpp \
../src/mcd_demo_main.cpp \
../src/mcd_loader_class.cpp \
../src/mcd_tools.cpp 

CPP_DEPS += \
./src/flash_tool_ihex.d \
./src/mcd_demo_main.d \
./src/mcd_loader_class.d \
./src/mcd_tools.d 

OBJS += \
./src/flash_tool_ihex.o \
./src/mcd_demo_main.o \
./src/mcd_loader_class.o \
./src/mcd_tools.o 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	x86_64-w64-mingw32-g++ -O3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src

clean-src:
	-$(RM) ./src/flash_tool_ihex.d ./src/flash_tool_ihex.o ./src/mcd_demo_main.d ./src/mcd_demo_main.o ./src/mcd_loader_class.d ./src/mcd_loader_class.o ./src/mcd_tools.d ./src/mcd_tools.o

.PHONY: clean-src

