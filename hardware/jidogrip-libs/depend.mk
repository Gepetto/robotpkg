# robotpkg depend.mk for:	hardware/jidogrip-libs
# Created:			Anthony Mallet on Wed, 21 Jan 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
JIDOGRIP_LIBS_DEPEND_MK:=	${JIDOGRIP_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			jidogrip-libs
endif

ifeq (+,$(JIDOGRIP_LIBS_DEPEND_MK)) # --------------------------------------

PREFER.jidogrip-libs?=		robotpkg

DEPEND_USE+=			jidogrip-libs
DEPEND_ABI.jidogrip-libs?=	jidogrip-libs>=1.1.1
DEPEND_DIR.jidogrip-libs?=	../../hardware/jidogrip-libs

SYSTEM_SEARCH.jidogrip-libs=	\
	'include/jidogrip.h'					\
	'lib/libjidogrip.la'					\
	'lib/pkgconfig/libjidogrip.pc:/Version/s/[^0-9.]//gp'

endif # JIDOGRIP_LIBS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
