# robotpkg depend.mk for:	graphics/pqp
# Created:			Severin Lemaignan on Tue, 31 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PQP_DEPEND_MK:=		${PQP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pqp
endif

ifeq (+,$(PQP_DEPEND_MK)) # ------------------------------------------------

PREFER.pqp?=		robotpkg

SYSTEM_SEARCH.pqp=\
	include/pqp/PQP.h	\
	lib/libPQP.a

DEPEND_USE+=		pqp

DEPEND_ABI.pqp?=	pqp>=1.3r2
DEPEND_DIR.pqp?=	../../graphics/pqp

endif # PQP_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
