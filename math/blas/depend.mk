# robotpkg depend.mk for:	math/blas
# Created:			Anthony Mallet on Thu, 28 Feb 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BLAS_DEPEND_MK:=	${BLAS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		blas
endif

ifeq (+,$(BLAS_DEPEND_MK)) # -----------------------------------------

PREFER.blas?=		system

DEPEND_USE+=		blas

DEPEND_ABI.blas?=	blas>=3.1
DEPEND_DIR.blas?=	../../math/blas

SYSTEM_SEARCH.blas= 	lib/libblas.*

SYSTEM_PKG.Fedora.blas=	blas-devel
SYSTEM_PKG.Ubuntu.blas=	libblas-dev
SYSTEM_PKG.Debian.blas=	libblas-dev

endif # BLAS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
