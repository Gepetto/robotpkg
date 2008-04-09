# $Id: $

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENHRP_JRL_DEPEND_MK:=	${OPENHRP_JRL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openhrp-jrl
endif

ifeq (+,$(OPENHRP_JRL_DEPEND_MK))
PREFER.openhrp-jrl?=	robotpkg

DEPEND_USE+=		openhrp-jrl

DEPEND_ABI.openhrp-jrl?=openhrp-jrl>=20060713r6
DEPEND_DIR.openhrp-jrl?=../../architecture/openhrp-jrl

SYSTEM_SEARCH.openhrp-jrl=\
	OpenHRP/bin/Auditor.sh			\
	OpenHRP/Common/corba/common.idl
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
