# robotpkg depend.mk for:	path/jrl-walkgen
# Created:			Anthony Mallet on Tue, 13 May 2008
#

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

SYSTEM_SEARCH.jrl-walkgen=\
	include/jrl/walkgen/patterngeneratorinterface.hh\
	lib/pkgconfig/jrl-walkgen.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
