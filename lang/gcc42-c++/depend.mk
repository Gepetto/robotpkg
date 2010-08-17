# robotpkg depend.mk for:	lang/gcc42-c++
# Created:			Anthony Mallet on Mon, 20 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GCC42_C++_DEPEND_MK:=	${GCC42_C++_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gcc42-c++
endif

ifeq (+,$(GCC42_C++_DEPEND_MK)) # ------------------------------------------

PREFER.gcc42?=		system
PREFER.gcc42-c++?=	${PREFER.gcc42}

DEPEND_USE+=		gcc42-c++

DEPEND_ABI.gcc42-c++?=	gcc42-c++>=4.2<4.3
DEPEND_DIR.gcc42-c++?=	../../lang/gcc42-c++

SYSTEM_DESCR.gcc42-c++ =gcc C++ compiler, version 4.2
SYSTEM_SEARCH.gcc42-c++ =\
	'bin/g++{42,}::% -dumpversion'	\
	'bin/cpp{42,}::% -dumpversion'

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_CXX+=$(word 1,${SYSTEM_FILES.gcc42-c++})
ROBOTPKG_CXXCPP+=$(word 2,${SYSTEM_FILES.gcc42-c++})

endif # GCC42_C++_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
