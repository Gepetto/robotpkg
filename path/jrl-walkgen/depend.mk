# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_WALKGEN_DEPEND_MK:=	${JRL_WALKGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-walkgen
endif

ifeq (+,$(JRL_WALKGEN_DEPEND_MK))
PREFER.jrl-walkgen?=	robotpkg

DEPEND_USE+=		jrl-walkgen

DEPEND_ABI.jrl-walkgen?=jrl-walkgen>=2.4.1
DEPEND_DIR.jrl-walkgen?=../../path/jrl-walkgen
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
