################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CFG_SRCS += \
../mcip_slave.cfg 

C_SRCS += \
../mcip_imgproc.c \
../mcip_slave_main.c 

OBJS += \
./mcip_imgproc.obj \
./mcip_slave_main.obj 

C_DEPS += \
./mcip_imgproc.pp \
./mcip_slave_main.pp 

GEN_MISC_DIRS += \
./configPkg/ 

GEN_CMDS += \
./configPkg/linker.cmd 

GEN_OPTS += \
./configPkg/compiler.opt 

GEN_FILES += \
./configPkg/linker.cmd \
./configPkg/compiler.opt 

GEN_FILES__QUOTED += \
"configPkg\linker.cmd" \
"configPkg\compiler.opt" 

GEN_MISC_DIRS__QUOTED += \
"configPkg\" 

C_DEPS__QUOTED += \
"mcip_imgproc.pp" \
"mcip_slave_main.pp" 

OBJS__QUOTED += \
"mcip_imgproc.obj" \
"mcip_slave_main.obj" 

C_SRCS__QUOTED += \
"../mcip_imgproc.c" \
"../mcip_slave_main.c" 


