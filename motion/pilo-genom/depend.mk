# robotpkg depend.mk for:	motion/pilo-genom
# Created:			Anthony Mallet on Fri, 23 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PILOGENOM_DEPEND_MK:=	${PILOGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pilo-genom
endif

ifeq (+,$(PILOGENOM_DEPEND_MK))
PREFER.pilo-genom?=	robotpkg

DEPEND_USE+=		pilo-genom

DEPEND_ABI.pilo-genom?=	pilo-genom>=1.2
DEPEND_DIR.pilo-genom?=	../../motion/pilo-genom

SYSTEM_SEARCH.pilo-genom=\
	include/pilo/piloStruct.h		\
	'lib/pkgconfig/pilo.pc:/Version/s/[^0-9.]//gp'

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
