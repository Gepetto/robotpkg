# robotpkg sysdep/avr-gcc.mk
# Created:			Anthony Mallet on Wed, 11 Feb 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
AVR_GCC_DEPEND_MK:=	${AVR_GCC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		avr-gcc
endif

ifeq (+,$(AVR_GCC_DEPEND_MK)) # --------------------------------------------

# make sure to define the C compiler alternative
include ../../mk/language/avr-c.mk

PREFER.avr-gcc?=	${PREFER.avr-c-compiler}

DEPEND_USE+=		avr-gcc

DEPEND_METHOD.avr-gcc?=	build
DEPEND_ABI.avr-gcc?=	avr-gcc>=4.5

SYSTEM_SEARCH.avr-gcc?=	\
	'bin/avr-gcc::% -dumpversion'

SYSTEM_PKG.Fedora.avr-gcc=avr-gcc
SYSTEM_PKG.Debian.avr-gcc=gcc-avr
SYSTEM_PKG.NetBSD.avr-gcc=cross/avr-gcc

export AVR_GCC=		$(word 1,${SYSTEM_FILES.avr-gcc})

# default flags used for the debug option
C_COMPILER_FLAGS_DEBUG?=	-g -O0 -Wall
C_COMPILER_FLAGS_NDEBUG?=	-O3 -DNDEBUG

# GNU ld option used to set the rpath.
COMPILER_RPATH_FLAG?=	-Wl,-rpath,

endif # AVR_GCC_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
