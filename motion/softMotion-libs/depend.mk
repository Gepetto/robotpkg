# robotpkg depend.mk for:	motion/softMotion-libs
# Created:			Xavier Broquere on Fri, 26 Feb 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SOFTMOTION-LIBS_DEPEND_MK:=	${SOFTMOTION-LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		softMotion-libs
endif

ifeq (+,$(SOFTMOTION-LIBS_DEPEND_MK)) # ----------------------------------

PREFER.softMotion-libs?=	robotpkg

SYSTEM_SEARCH.softMotion-libs=\
	include/softMotion/softMotion.h 				\
	'lib/pkgconfig/softMotion-libs.pc:/Version/s/[^0-9.]//gp'	\
	'lib/libsoftMotion.{a,so,dylib}'

DEPEND_USE+=		softMotion-libs

DEPEND_ABI.softMotion-libs?=softMotion-libs>=3.1
DEPEND_DIR.softMotion-libs?=../../motion/softMotion-libs

endif # SOFTMOTION-LIBS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
