# robotpkg depend.mk for:	path/libp3d
# Created:			Arnaud Degroote on Fri, 16 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBP3D_DEPEND_MK:=${LIBP3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libp3d
endif

ifeq (+,$(LIBP3D_DEPEND_MK))
PREFER.libp3d?=	robotpkg

DEPEND_USE+=		libp3d

DEPEND_ABI.libp3d?=	libp3d>=1.3
DEPEND_DIR.libp3d?=	../../path/libp3d

SYSTEM_SEARCH.libp3d=\
	include/libp3d.h	\
	lib/pkgconfig/libp3d.pc
endif

include ../../math/t3d/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
