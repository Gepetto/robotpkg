# robotpkg depend.mk for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PA10LIBS_DEPEND_MK:=	${SOFTMOTIONLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		softMotion-libs
endif

ifeq (+,$(SOFTMOTIONLIBS_DEPEND_MK)) # -------------------------------------
PREFER.softMotion-libs?=	robotpkg

DEPEND_USE+=		softMotion-libs

DEPEND_ABI.softMotion-libs?=	softMotion-libs>=2.0
DEPEND_DIR.softMotion-libs?=	../../motion/softMotion-libs

SYSTEM_SEARCH.softMotion-libs=\
	include/softMotion/softMotion.h \   				\
	lib/libsoftMotion.so

endif # SOFTMOTIONLIBS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
