# robotpkg depend.mk for:	hardware/openni
# Created:			Matthieu Herrb on Tue, 14 Dec 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENNI_DEPEND_MK:=${OPENNI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openni
endif

ifeq (+,$(OPENNI_DEPEND_MK))
PREFER.openni?=	robotpkg

DEPEND_USE+=		openni

DEPEND_ABI.openni?=	openni>=20101212
DEPEND_DIR.openni?=	../../middleware/openni

SYSTEM_SEARCH.openni=\
	bin/niReg \
	bin/niLicense \
	include/ni/XnTypes.h \
	lib/libOpenNI.so
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
