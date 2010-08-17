# robotpkg depend.mk for:	hardware/spnav-libs
# Created:			Xavier Broquere on Fri, 20 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPNAV_LIBS_DEPEND_MK:=${SPNAV_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		spnav-libs
endif

ifeq (+,$(SPNAV_LIBS_DEPEND_MK))
PREFER.spnav-libs?=	robotpkg

DEPEND_USE+=		spnav-libs

DEPEND_ABI.spnav-libs?=	spnav-libs>=1.0
DEPEND_DIR.spnav-libs?=	../../hardware/spnav-libs

DEPEND_PKG_CONFIG.spnav-libs+=lib/pkgconfig

SYSTEM_SEARCH.spnav-libs=\
	include/spnav-libs/spnav.h \
	lib/libspnav.so	\
	lib/pkgconfig/spnav-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
