# robotpkg depend.mk for:	hardware/velodyne-libs
# Created:			Matthieu Herrb on Fri, 25 Jun 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VELODYNE_LIBS_DEPEND_MK:=${VELODYNE_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		velodyne-libs
endif

ifeq (+,$(VELODYNE_LIBS_DEPEND_MK))
PREFER.velodyne-libs?=	robotpkg

DEPEND_USE+=		velodyne-libs

DEPEND_ABI.velodyne-libs?=	velodyne-libs>=0.2
DEPEND_DIR.velodyne-libs?=	../../robots/velodyne-libs

SYSTEM_SEARCH.velodyne-libs=\
	bin/velodyneTest \
	include/velodyne/velodyneLib.h \
	lib/pkgconfig/velodyne-libs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
