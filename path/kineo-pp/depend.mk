# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
KINEO_PP_DEPEND_MK:=	${KINEO_PP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		kineo-pp
endif

ifeq (+,$(KINEO_PP_DEPEND_MK))
PREFER.kineo-pp?=	robotpkg

DEPEND_USE+=		kineo-pp

DEPEND_ABI.kineo-pp?=	kineo-pp>=2.04.501
DEPEND_DIR.kineo-pp?=	../../path/kineo-pp
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
