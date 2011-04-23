# robotpkg depend.mk for:	motion/mwalk-genom
# Created:			Anthony Mallet on Wed, 28 Jul 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MWALK_GENOM_DEPEND_MK:=	${MWALK_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mwalk-genom
endif

ifeq (+,$(MWALK_GENOM_DEPEND_MK)) # ----------------------------------------

PREFER.mwalk-genom?=	robotpkg

DEPEND_USE+=		mwalk-genom

DEPEND_ABI.mwalk-genom?=mwalk-genom>=1.0
DEPEND_DIR.mwalk-genom?=../../motion/mwalk-genom

SYSTEM_SEARCH.mwalk-genom=\
	include/mwalk/mwalkStruct.h			\
	'lib/pkgconfig/mwalk.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

