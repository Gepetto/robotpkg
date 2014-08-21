# robotpkg depend.mk for:	hardware/openni2
# Created:			Matthieu Herrb on Tue, 14 Dec 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENNI2_DEPEND_MK:=	${OPENNI2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openni2
endif

ifeq (+,$(OPENNI2_DEPEND_MK)) # --------------------------------------------

PREFER.openni2?=	robotpkg

DEPEND_USE+=		openni2

DEPEND_ABI.openni2?=	openni2>=2
DEPEND_DIR.openni2?=	../../middleware/openni2

_openni2_v=	/define[ ]*ONI_VERSION_\(MA\|MI\\|BU\)/{s/$$/./;H;};
_openni2_v+=	$${g;s/[^0-9.]//g;s/[.]$$//p;}

SYSTEM_SEARCH.openni2=\
	'include/openni2/Openni2.h'			\
	'include/openni2/OniVersion.h:${_openni2_v}'	\
	'lib/libOpenni2.so'

endif # OPENNI2_DEPEND -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
