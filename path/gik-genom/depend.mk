# robotpkg depend.mk for:	path/gik-genom
# Created:			Anthony Mallet on Wed, 24 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GIK_GENOM_DEPEND_MK:=	${GIK_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gik-genom
endif

ifeq (+,$(GIK_GENOM_DEPEND_MK)) # ------------------------------------------

PREFER.gik-genom?=	robotpkg

DEPEND_USE+=		gik-genom

DEPEND_ABI.gik-genom?=	gik-genom>=1.5.1r2
DEPEND_DIR.gik-genom?=	../../path/gik-genom

SYSTEM_SEARCH.gik-genom=\
	include/gik/gikStruct.h					\
	'lib/pkgconfig/gik.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

