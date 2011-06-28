# robotpkg depend.mk for:	interfaces/abstract-gik-task
# Created:			florent on Fri, 30 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_INTERFACE_GIKTASK_DEPEND_MK:=${JRL_INTERFACE_GIKTASK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				abstract-gik-task
endif

ifeq (+,$(JRL_INTERFACE_GIKTASK_DEPEND_MK))
PREFER.abstract-gik-task?=		robotpkg

DEPEND_USE+=				abstract-gik-task

DEPEND_ABI.abstract-gik-task?=	abstract-gik-task>=2.4
DEPEND_DIR.abstract-gik-task?=	../../interfaces/abstract-gik-task

SYSTEM_SEARCH.abstract-gik-task=\
	include/gikTask/jrlGikStateConstraint.h		\
	lib/pkgconfig/abstract-gik-task.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
