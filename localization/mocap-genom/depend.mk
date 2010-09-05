# robotpkg depend.mk for:	localization/mocap-genom
# Created:			Séverin Lemaignan on Wed, 1 Sep 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MOCAP-GENOM_DEPEND_MK:=	${MOCAP-GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mocap-genom
endif

ifeq (+,$(MOCAP-GENOM_DEPEND_MK)) # ----------------------------------

PREFER.mocap-genom?=	robotpkg

SYSTEM_SEARCH.mocap-genom=\
	include/mocap/mocapStruct.h			\
	'lib/pkgconfig/mocap.pc:/Version/s/[^0-9.]//gp'	\
	bin/mocap

DEPEND_USE+=		mocap-genom

DEPEND_ABI.mocap-genom?=mocap-genom>=1.1
DEPEND_DIR.mocap-genom?=../../localization/mocap-genom

endif # MOCAP-GENOM_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
