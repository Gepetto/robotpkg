# robotpkg depend.mk for:	architecture/genom-openhrp-plugin
# Created:			Anthony Mallet on Wed, 19 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM_OPENHRP_DEPEND_MK:=${GENOM_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom-openhrp-plugin
endif

ifeq (+,$(GENOM_OPENHRP_DEPEND_MK)) # --------------------------------

PREFER.genom-openhrp-plugin?=	robotpkg

DEPEND_USE+=		genom-openhrp-plugin

DEPEND_ABI.genom-openhrp-plugin?=genom-openhrp-plugin>=1.4
DEPEND_DIR.genom-openhrp-plugin?=../../architecture/genom-openhrp-plugin

SYSTEM_SEARCH.genom-openhrp-plugin=\
	include/genom-openhrp/genom-hrp2.h	\
	'lib/pkgconfig/genom-openhrp-plugin.pc:/Version/s/[^0-9.]*//p'

endif # GENOM_OPENHRP_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
