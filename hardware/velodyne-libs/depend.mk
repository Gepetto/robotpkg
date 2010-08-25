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

DEPEND_ABI.velodyne-libs?=	velodyne-libs>=0.4
DEPEND_DIR.velodyne-libs?=	../../hardware/velodyne-libs

SYSTEM_SEARCH.velodyne-libs=\
	bin/velodyneAcquire		\
	include/velodyne/velodyneLib.h	\
	'lib/pkgconfig/velodyne-libs.pc:/Version/s/[^0-9.]//gp'
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
