# robotpkg depend.mk for:	path/kineo-pp
# Created:			Anthony Mallet on Tue, 13 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
KINEO_PP_DEPEND_MK:=	${KINEO_PP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		kineo-pp
endif

ifeq (+,$(KINEO_PP_DEPEND_MK)) # -------------------------------------

PREFER.kineo-pp?=	robotpkg

DEPEND_USE+=		kineo-pp

DEPEND_ABI.kineo-pp?=	kineo-pp>=2.04.501r1
DEPEND_DIR.kineo-pp?=	../../path/kineo-pp

SYSTEM_SEARCH.kineo-pp=\
	kineo/include/KineoController/kppCommand.h \
	kineo/lib/libKineoController.so \
	'lib/pkgconfig/KineoPathPlanner.pc:/Version/s/[^0-9]//gp'

endif # KINEO_PP_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

GCC_REQUIRED+=		>=4.0
include ../../devel/boost-headers/depend.mk
