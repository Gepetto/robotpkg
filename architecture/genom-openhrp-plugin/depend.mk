# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM_OPENHRP_DEPEND_MK:=${GENOM_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom-openhrp-plugin
endif

ifeq (+,$(GENOM_OPENHRP_DEPEND_MK))
PREFER.genom-openhrp-plugin?=	robotpkg

DEPEND_USE+=		genom-openhrp-plugin

DEPEND_ABI.genom-openhrp-plugin?=genom-openhrp-plugin>=1.0
DEPEND_DIR.genom-openhrp-plugin?=../../architecture/genom-openhrp-plugin

DEPEND_PKG_CONFIG.genom-openhrp-plugin+=lib/pkgconfig

SYSTEM_SEARCH.genom-openhrp-plugin=\
	include/genom-openhrp/genom-hrp2.h	\
	lib/pkgconfig/genom-openhrp-plugin.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
