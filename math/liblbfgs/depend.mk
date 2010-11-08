# robotpkg depend.mk for:	math/liblbfgs
# Created:			Nizar Sallem on Mon, 8 Nov 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBLBFGS_DEPEND_MK:=	${LIBLBFGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		liblbfgs
endif

ifeq (+,$(LIBLBFGS_DEPEND_MK)) # -------------------------------------------

PREFER.liblbfgs?=	robotpkg

DEPEND_USE+=		liblbfgs
DEPEND_ABI.liblbfgs?=	liblbfgs>=1.9
DEPEND_DIR.liblbfgs?=	../../math/liblbfgs

SYSTEM_SEARCH.liblbfgs=\
	include/lbfgs.h						\
	'lib/liblbfgs.la:/dlname/{s/[^0-9.]//g;s/\.$//p;}'

endif # LIBLBFGS_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
