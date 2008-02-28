# $NetBSD: gcc.mk,v 1.86 2006/12/02 22:32:59 jschauma Exp $
#
# This is the compiler definition for the GNU Compiler Collection.
#

ifndef COMPILER_GCC_MK
COMPILER_GCC_MK=	defined

include ../../mk/robotpkg.prefs.mk

GCC_REQD+=	2.8.0

## _CC is the full path to the compiler named by ${CC} if it can be found.
ifndef _CC
_CC:=	$(call pathsearch,${CC},${PATH})
MAKEOVERRIDES+=	_CC=$(call quote,${_CC})
endif

ifndef _GCC_VERSION
_GCC_VERSION_STRING:=\
	$(shell ${_CC} -v 2>&1 | ${GREP} 'gcc version' ) 2>/dev/null || ${ECHO} 0)
  ifneq (,$(filter gcc%,${_GCC_VERSION_STRING}))
_GCC_VERSION:=	$(shell ${_CC} -dumpversion)
  else
_GCC_VERSION=	0
  endif
endif

## Check if we are using robotpkg gcc
ifneq (,$(filter ${LOCALBASE}/%,${_CC}))
_IS_ROBOTPKG_GCC=	yes
else
_IS_ROBOTPKG_GCC=	no
endif

_GCCBINDIR=		$(dirname ${_CC})

## GNU ld option used to set the rpath
LINKER_RPATH_FLAG=	-R

## GCC passes rpath directives to the linker using "-Wl,-R".
COMPILER_RPATH_FLAG=	-Wl,${LINKER_RPATH_FLAG}


## Point the variables that specify the compiler to the installed
## GCC executables.
##
#_GCC_DIR=	${WRKDIR}/.gcc
#_GCC_VARS=	# empty

#_GCCBINDIR=	${_CC:H}
#.endif
#.if exists(${_GCCBINDIR}/gcc)
#_GCC_VARS+=	CC
#_GCC_CC=	${_GCC_DIR}/bin/gcc
#_ALIASES.CC=	cc gcc
#CCPATH=		${_GCCBINDIR}/gcc
#PKG_CC:=	${_GCC_CC}
#.endif
#.if exists(${_GCCBINDIR}/cpp)
#_GCC_VARS+=	CPP
#_GCC_CPP=	${_GCC_DIR}/bin/cpp
#_ALIASES.CPP=	cpp
#CPPPATH=	${_GCCBINDIR}/cpp
#PKG_CPP:=	${_GCC_CPP}
#.endif
#.if exists(${_GCCBINDIR}/g++)
#_GCC_VARS+=	CXX
#_GCC_CXX=	${_GCC_DIR}/bin/g++
#_ALIASES.CXX=	c++ g++
#CXXPATH=	${_GCCBINDIR}/g++
#PKG_CXX:=	${_GCC_CXX}
#.endif

ifneq (,$(filter fortran,${USE_LANGUAGES}))
  include ${PKGSRCDIR}/lang/gcc4-fortran/depend.mk
  FC=	${PREFIX.gcc4-fortran}/bin/gfortran
endif

endif	# COMPILER_GCC_MK
