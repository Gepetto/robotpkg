# robotpkg sysdep/g++.mk
# Created:			Anthony Mallet on Thu Oct 23 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
G++_DEPEND_MK:=		${G++_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		g++
endif

ifeq (+,$(G++_DEPEND_MK)) # ------------------------------------------------

# make sure to define the C++ compiler alternative
include ../../mk/language/c++.mk

PREFER.c-compiler?=	system
PREFER.gcc?=		${PREFER.c-compiler}
PREFER.g++ ?=		${PREFER.gcc}

DEPEND_USE+=		g++

DEPEND_ABI.g++ ?=	g++>=3

SYSTEM_PKG.Fedora.g++ =	gcc-c++
SYSTEM_PKG.Ubuntu.g++ =	g++
SYSTEM_PKG.Debian.g++ =	g++

SYSTEM_SEARCH.g++ =\
	'bin/g++::% -dumpversion'

export GXX=		$(word 1,${SYSTEM_FILES.g++})

# default flags used for the debug option
CXX_COMPILER_FLAGS_DEBUG?=	-g -O0 -Wall
CXX_COMPILER_FLAGS_NDEBUG?=	-O3 -DNDEBUG

# GNU ld option used to set the rpath.
COMPILER_RPATH_FLAG?=	-Wl,-rpath,

endif # G++_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
