# robotpkg depend.mk for:	robots/hrp2-genom
# Created:			Anthony Mallet on Thu, 4 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRP2_GENOM_DEPEND_MK:=	${HRP2_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrp2-genom
endif

ifeq (+,$(HRP2_GENOM_DEPEND_MK)) # -----------------------------------------

PREFER.hrp2-genom?=	robotpkg

DEPEND_USE+=		hrp2-genom

DEPEND_ABI.hrp2-genom?=	hrp2-genom>=1.1
DEPEND_DIR.hrp2-genom?=	../../robots/hrp2-genom

SYSTEM_SEARCH.hrp2-genom=\
	include/hrp2/hrp2Struct.h					\
	'lib/pkgconfig/hrp2.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
