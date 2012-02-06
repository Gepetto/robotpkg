# robotpkg depend.mk for:	math/sensFusion-libs
# Created:			Xavier Broquere on Wed, 25 Jan 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SENSFUSION-LIBS_DEPEND_MK:=	${SENSFUSION-LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sensFusion-libs
endif

ifeq (+,$(SENSFUSION-LIBS_DEPEND_MK)) # ----------------------------------

PREFER.sensFusion-libs?=	robotpkg

SYSTEM_SEARCH.sensFusion-libs=\
	include/sensFusion-libs/sensFlt.hpp				\
	'lib/pkgconfig/sensFusion-libs.pc:/Version/s/[^0-9.]//gp'	\
	'lib/libsensFusion-libs.{a,so}'

DEPEND_USE+=		sensFusion-libs

DEPEND_ABI.sensFusion-libs?=sensFusion-libs>=1.3
DEPEND_DIR.sensFusion-libs?=../../math/sensFusion-libs

endif # SENSFUSION-LIBS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
