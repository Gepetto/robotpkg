# robotpkg depend.mk for:	audio/textos-genom
# Created:			Anthony Mallet on Wed, 24 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TEXTOS_GENOM_DEPEND_MK:=${TEXTOS_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		textos-genom
endif

ifeq (+,$(TEXTOS_GENOM_DEPEND_MK)) # ---------------------------------------

PREFER.textos-genom?=	robotpkg

DEPEND_USE+=		textos-genom

DEPEND_ABI.textos-genom?=textos-genom>=1.0
DEPEND_DIR.textos-genom?=../../audio/textos-genom

SYSTEM_SEARCH.textos-genom=\
	include/textos/textos-struct.h					\
	'lib/pkgconfig/textos.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

