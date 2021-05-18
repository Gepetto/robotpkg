# robotpkg sysdep/arm-none-eabi-gcc.mk
# Created:			Anthony Mallet on Tue, 18 May 2021
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ARM_NONE_EABI_GCC_DEPEND_MK:=	${ARM_NONE_EABI_GCC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=			arm-none-eabi-gcc
endif

ifeq (+,$(ARM_NONE_EABI_GCC_DEPEND_MK)) # ----------------------------------

# make sure to define the C compiler alternative
include ../../mk/language/arm-none-eabi-c.mk

PREFER.arm-none-eabi-gcc?=	system

DEPEND_USE+=			arm-none-eabi-gcc

DEPEND_METHOD.arm-none-eabi-gcc?=build
DEPEND_ABI.arm-none-eabi-gcc?=	arm-none-eabi-gcc>=4.5

SYSTEM_SEARCH.arm-none-eabi-gcc?=	\
  'bin/arm-none-eabi-gcc::% -dumpversion'

SYSTEM_PKG.Fedora.arm-none-eabi-gcc=arm-none-eabi-gcc-cs
SYSTEM_PKG.Debian.arm-none-eabi-gcc=gcc-arm-none-eabi
SYSTEM_PKG.NetBSD.arm-none-eabi-gcc=cross/arm-none-eabi-gcc

SYSTEM_PREFIX.arm-none-eabi-gcc=\
  ${SYSTEM_PREFIX}							\
  $(if $(filter NetBSD,${OPSYS}),${SYSTEM_PREFIX:=/cross-arm-none-eabi})

export ARM_NONE_EABI_GCC=	$(word 1,${SYSTEM_FILES.arm-none-eabi-gcc})

# default flags used for the debug option
C_COMPILER_FLAGS_DEBUG?=	-g -O0 -Wall
C_COMPILER_FLAGS_NDEBUG?=	-O3 -DNDEBUG

# GNU ld option used to set the rpath.
COMPILER_RPATH_FLAG?=	-Wl,-rpath,

endif # ARM_NONE_EABI_GCC_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
