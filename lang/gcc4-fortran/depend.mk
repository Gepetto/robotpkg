# $Id: depend.mk 2008/10/19 20:41:52 tho $

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GCC4_FORTRAN_DEPEND_MK:=	${GCC4_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gcc4-fortran
endif

ifeq (+,$(GCC4_FORTRAN_DEPEND_MK))
PREFER.gcc4-fortran?=		system

DEPEND_USE+=			gcc4-fortran

DEPEND_ABI.gcc4-fortran?=	gcc4-fortran>=4.2
DEPEND_DIR.gcc4-fortran?=	../../lang/gcc4-fortran

DEPEND_LIBS.gcc4-fortran+=	-lgfortran

SYSTEM_SEARCH.gcc4-fortran=	\
	'bin/gfortran:/[0-9.]/s/[^0-9.]//gp:% -dumpversion'	\
	'lib/libgfortran.so*'
endif

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
