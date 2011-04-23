# robotpkg depend.mk for:	hardware/velodyne-genom
# Created:			Anthony Mallet on Wed, 25 Aug 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
VELODYNE_GENOM_DEPEND_MK:=	${VELODYNE_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			velodyne-genom
endif

ifeq (+,$(VELODYNE_GENOM_DEPEND_MK)) # -------------------------------------

PREFER.velodyne-genom?=	robotpkg

DEPEND_USE+=			velodyne-genom

DEPEND_ABI.velodyne-genom?=	velodyne-genom>=1.0
DEPEND_DIR.velodyne-genom?=	../../hardware/velodyne-genom

SYSTEM_SEARCH.velodyne-genom=\
	include/velodyne/velodyneStruct.h	\
	'lib/pkgconfig/velodyne.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # VELODYNE_GENOM_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
