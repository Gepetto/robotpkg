# robotpkg depend.mk for:	interfaces/jrl-mal
# Created:			Anthony Mallet on Fri, 30 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_MAL_DEPEND_MK:=	${JRL_MAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-mal
endif

ifeq (+,$(JRL_MAL_DEPEND_MK)) # --------------------------------------------

PREFER.jrl-mal?=	robotpkg

DEPEND_USE+=		jrl-mal

DEPEND_ABI.jrl-mal?=	jrl-mal>=1.8.3
DEPEND_DIR.jrl-mal?=	../../interfaces/jrl-mal

SYSTEM_SEARCH.jrl-mal=\
	include/jrl/mal/abstract.hh	\
	'lib/pkgconfig/jrl-mal.pc:/Version/s/[^0-9.]//gp'

endif # JRL_MAL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

