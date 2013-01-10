# robotpkg sysdep/gcc.mk
# Created:			Anthony Mallet on Thu Oct 23 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC_DEPEND_MK:=		${GCC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		gcc
endif

ifeq (+,$(GCC_DEPEND_MK)) # ------------------------------------------------

# make sure to define the C compiler alternative
include ../../mk/language/c.mk

PREFER.gcc?=		${PREFER.c-compiler}

DEPEND_USE+=		gcc

DEPEND_METHOD.gcc?=	build
DEPEND_ABI.gcc?=	gcc>=3

SYSTEM_SEARCH.gcc?=	\
	'bin/gcc::% -dumpversion'

export GCC=		$(word 1,${SYSTEM_FILES.gcc})

# default flags used for the debug option
C_COMPILER_FLAGS_DEBUG?=	-g -O0 -Wall
C_COMPILER_FLAGS_NDEBUG?=	-O3 -DNDEBUG

# GNU ld option used to set the rpath.
COMPILER_RPATH_FLAG?=	-Wl,-rpath,

endif # GCC_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
