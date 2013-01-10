# robotpkg sysdep/clang++.mk
# Created:			Anthony Mallet on Wed, 9 Jan 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CLANG++_DEPEND_MK:=	${CLANG++_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		clang++
endif

ifeq (+,$(CLANG++_DEPEND_MK)) # --------------------------------------------

# make sure to define the C++ compiler alternative
include ../../mk/language/c++.mk

PREFER.clang?=		${PREFER.c++-compiler}
PREFER.clang++?=	${PREFER.clang}

DEPEND_USE+=		clang++

DEPEND_METHOD.clang++?=	build
DEPEND_ABI.clang++?=	clang++>=3

SYSTEM_SEARCH.clang++?=	\
	'bin/clang++:1{s/^[^0-9.]*//;s/[^0-9.].*$$//;p;}:% --version'

export CLANGXX=	$(word 1,${SYSTEM_FILES.clang++})

# default flags used for the debug option
CXX_COMPILER_FLAGS_DEBUG?=	-g -O0 -Wall
CXX_COMPILER_FLAGS_NDEBUG?=	-O3 -DNDEBUG

# clang option used to set the rpath.
COMPILER_RPATH_FLAG?=	-Wl,-rpath,

endif # CLANG++_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
