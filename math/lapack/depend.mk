# robotpkg depend.mk for:	math/lapack
# Created:			Anthony Mallet on Mon, 7 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LAPACK_DEPEND_MK:=	${LAPACK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lapack
endif

ifeq (+,$(LAPACK_DEPEND_MK)) # ---------------------------------------

PREFER.lapack?=		system

DEPEND_USE+=		lapack

DEPEND_ABI.lapack?=	lapack
DEPEND_DIR.lapack?=	../../math/lapack

SYSTEM_SEARCH.lapack=\
  'lib/liblapack.{so,[^a]*,a}'		\
  'lib/libblas.{so,[^a]*,a}'

SYSTEM_PKG.Fedora.lapack=	lapack-devel
SYSTEM_PKG.Ubuntu.lapack=	liblapack-dev
SYSTEM_PKG.Debian.lapack=	liblapack-dev

export LAPACK_LIB=	$(word 1,${SYSTEM_FILES.lapack})
export BLAS_LIB=	$(word 2,${SYSTEM_FILES.lapack})

endif # LAPACK_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
