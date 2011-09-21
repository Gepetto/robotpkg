# robotpkg depend.mk for:	image/viman-genom
# Created:			Séverin Lemaignan on Tue, 31 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIMAN-GENOM_DEPEND_MK:=	${VIMAN-GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viman-genom
endif

ifeq (+,$(VIMAN-GENOM_DEPEND_MK)) # ----------------------------------

PREFER.viman-genom?=	robotpkg

SYSTEM_SEARCH.viman-genom=\
	include/viman/vimanStruct.h			\
	'lib/pkgconfig/viman.pc:/Version/s/[^0-9.]//gp'	\
	bin/viman

DEPEND_USE+=		viman-genom

DEPEND_ABI.viman-genom?=viman-genom>=1.4
DEPEND_DIR.viman-genom?=../../image/viman-genom


include ../../architecture/genom/depend.mk

endif # VIMAN-GENOM_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
