# robotpkg depend.mk for:	path/kineo-pp
# Created: Mickael Barriere on Friday, 8 April 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
KINEO_PP_2_06_DEPEND_MK:=	${KINEO_PP_2_06_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		kineo-pp
endif

ifeq (+,$(KINEO_PP_2_06_DEPEND_MK)) # -------------------------------------

PREFER.kineo-pp?=	robotpkg

DEPEND_USE+=		kineo-pp

DEPEND_ABI.kineo-pp?=	kineo-pp>=2.06.000
DEPEND_DIR.kineo-pp?=	../../path/kineo-pp

SYSTEM_SEARCH.kineo-pp=\
	kineo-2.06/include/KineoController/kppCommand.h \
	kineo-2.06/lib/libKineoController.so \
	'lib/pkgconfig/Kite.pc:/Version/s/[^0-9]//gp'

endif # KINEO_PP_2_06_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

GCC_REQUIRED+=		>=4.0
include ../../devel/boost-headers/depend.mk
