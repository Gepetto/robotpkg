# robotpkg depend.mk for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRLMATHTOOLS_DEPEND_MK:=${JRLMATHTOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-mathtools
endif

ifeq (+,$(JRLMATHTOOLS_DEPEND_MK)) # ---------------------------------

PREFER.jrl-mathtools?=	robotpkg

DEPEND_USE+=		jrl-mathtools

DEPEND_ABI.jrl-mathtools?=jrl-mathtools>=1.2
DEPEND_DIR.jrl-mathtools?=../../math/jrl-mathtools

SYSTEM_SEARCH.jrl-mathtools=\
	include/jrl/mathtools/vector4.hh

endif # JRLMATHTOOLS_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
