# robotpkg depend.mk for:	interfaces/jrl-interface-giktask
# Created:			florent on Fri, 30 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_INTERFACE_GIKTASK_DEPEND_MK:=${JRL_INTERFACE_GIKTASK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				jrl-interface-giktask
endif

ifeq (+,$(JRL_INTERFACE_GIKTASK_DEPEND_MK))
PREFER.jrl-interface-giktask?=		robotpkg

DEPEND_USE+=				jrl-interface-giktask

DEPEND_ABI.jrl-interface-giktask?=	jrl-interface-giktask>=2.4
DEPEND_DIR.jrl-interface-giktask?=	../../interfaces/jrl-interface-giktask

SYSTEM_SEARCH.jrl-interface-giktask=\
	include/gikTask/jrlGikStateConstraint.h		\
	lib/pkgconfig/abstractGikTask.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
