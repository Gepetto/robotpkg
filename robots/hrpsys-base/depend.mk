# robotpkg depend.mk for:	robots/hrpsys-base
# Created:			Anthony Mallet on Fri, 25 Aug 2017
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRPSYS_BASE_DEPEND_MK:=	${HRPSYS_BASE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrpsys-base
endif

ifeq (+,$(HRPSYS_BASE_DEPEND_MK)) # ----------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  # on Ubuntu, the system packages are provided by ros
  include ../../meta-pkgs/ros-base/depend.common
  ROS_DEPEND_USE+=		hrpsys-base
  PREFER.hrpsys-base?=		${PREFER.ros-base}
  SYSTEM_PREFIX.hrpsys-base?=	${SYSTEM_PREFIX.ros-base}

  SYSTEM_PKG.Ubuntu.hrpsys-base?=	ros-${PKG_ALTERNATIVE.ros}-hrpsys
endif
PREFER.hrpsys-base?=	robotpkg

DEPEND_USE+=		hrpsys-base

DEPEND_ABI.hrpsys-base?=hrpsys-base>=3
DEPEND_DIR.hrpsys-base?=../../robots/hrpsys-base

SYSTEM_SEARCH.hrpsys-base=\
  'bin/hrpsys-monitor'					\
  'include/hrpsys/io/iob.h'				\
  'lib/libhrpIo.so'					\
  'lib/pkgconfig/hrpsys-base.pc:/Version/s/[^0-9.]//gp'

endif # --- HRPSYS_BASE_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
