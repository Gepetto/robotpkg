# robotpkg sysdep/gcc-c.mk
# Created:			Anthony Mallet on Mon Jan 26 2009
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GCC_FORTRAN_DEPEND_MK:=		${GCC_FORTRAN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gcc-fortran
endif

ifeq (+,$(GCC_FORTRAN_DEPEND_MK)) # ----------------------------------------

# make sure to define the fortran compiler alternative
include ../../mk/language/fortran.mk

PREFER.gcc?=			${PREFER.fortran-compiler}
PREFER.gcc-fortran?=		${PREFER.gcc}

DEPEND_USE+=			gcc-fortran

DEPEND_ABI.gcc-fortran?=	gcc-fortran>=3

SYSTEM_PKG.Fedora.gcc-fortran=	gcc-gfortran
SYSTEM_PKG.Ubuntu.gcc-fortran=	gfortran

SYSTEM_SEARCH.gcc-fortran=	\
	'{,gcc[0-9]*/}bin/{gfortran,g77}:${_vregex.gcc-fortran}:% -dumpversion'
_vregex.gcc-fortran=1s/[^0-9.]*\([0-9.]*\).*$$/\1/p

export GFORTRAN=		$(word 1,${SYSTEM_FILES.gcc-fortran})

CMAKE_ARGS+=	-DCMAKE_SHARED_LIBRARY_SONAME_Fortran_FLAG=-Wl,-soname,

endif # GCC_FORTRAN_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
