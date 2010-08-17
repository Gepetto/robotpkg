# robotpkg depend.mk for:	hardware/spnav-kmod
# Created:			Xavier Broquere on Fri, 20 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPNAV_KMOD_DEPEND_MK:=${SPNAV_KMOD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		spnav-kmod
endif

ifeq (+,$(SPNAV_KMOD_DEPEND_MK))
PREFER.spnav-kmod?=	robotpkg

DEPEND_USE+=		spnav-kmod

DEPEND_ABI.spnav-kmod?=	spnav-kmod>=1.0
DEPEND_DIR.spnav-kmod?=	../../hardware/spnav-kmod

DEPEND_PKG_CONFIG.spnav-kmod+=lib/pkgconfig

SYSTEM_SEARCH.spnav-kmod=\
	bin/spacenavd
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
