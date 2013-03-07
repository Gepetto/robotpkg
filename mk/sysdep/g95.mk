# robotpkg sysdep/g95.mk
# Created:			Anthony Mallet on Thu Mar  7 2013
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
G95_DEPEND_MK:=			${G95_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			g95
endif

ifeq (+,$(G95_DEPEND_MK)) # ------------------------------------------------

# make sure to define the fortran compiler alternative
include ../../mk/language/fortran.mk

PREFER.g95?=			system

DEPEND_USE+=			g95

DEPEND_ABI.g95?=		g95>=0.92

SYSTEM_PKG.NetBSD.g95=		lang/g95

SYSTEM_SEARCH.g95=	\
	'bin/g95:${_vregex.g95}:% -dumpversion'
_vregex.g95=/(g95.*)/{s/^.*(g95[^0-9.]*//;s/[^0-9.].*//;p;q;}

export G95=		$(word 1,${SYSTEM_FILES.g95})

CMAKE_ARGS+=	-DCMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG=-Wl,-soname,

endif # G95_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
