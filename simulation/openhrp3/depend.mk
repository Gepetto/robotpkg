# robotpkg depend.mk for:	simulation/openhrp3
# Created:			Anthony Mallet on Thu, 24 Aug 2017
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENHRP3_DEPEND_MK:=	${OPENHRP3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openhrp3
endif

ifeq (+,$(OPENHRP3_DEPEND_MK)) # -------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  # on Ubuntu, the system packages are provided by ros
  include ../../meta-pkgs/ros-base/depend.common
  ROS_DEPEND_USE+=		openhrp3
  PREFER.openhrp3?=		${PREFER.ros-base}
  SYSTEM_PREFIX.openhrp3?=	${SYSTEM_PREFIX.ros-base}
endif
PREFER.openhrp3?=	robotpkg

DEPEND_USE+=		openhrp3

DEPEND_ABI.openhrp3?=	openhrp3>=3
DEPEND_DIR.openhrp3?=	../../simulation/openhrp3

SYSTEM_SEARCH.openhrp3=\
  'bin/openhrp-project-generator'					\
  'include/OpenHRP-3.[0-9]/hrpModel/Config.h'				\
  'lib/libhrpModel-3.[0-9].so'						\
  'lib/pkgconfig/openhrp3.[0-9].pc:/Version/s/[^0-9.]//gp'

endif # --- OPENHRP3_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
