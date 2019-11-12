# robotpkg depend.mk for:	interfaces/humanoid-nav-msgs
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HUMANOID_NAV_MSGS_DEPEND_MK:=	${HUMANOID_NAV_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			humanoid-nav-msgs
endif

ifeq (+,$(HUMANOID_NAV_MSGS_DEPEND_MK)) # ----------------------------------

# On distributions that provide ros<=kinetic, use the system ROS package
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04 14.04 16.04,${OS_VERSION}))
    include ../../meta-pkgs/ros-base/depend.common
    PREFER.humanoid-nav-msgs?=		${PREFER.ros-base}
    SYSTEM_PREFIX.humanoid-nav-msgs?=	${SYSTEM_PREFIX.ros-base}
  endif
endif

PREFER.humanoid-nav-msgs?=		robotpkg

DEPEND_USE+=			humanoid-nav-msgs

DEPEND_ABI.humanoid-nav-msgs?=	humanoid-nav-msgs>=0.1
DEPEND_DIR.humanoid-nav-msgs?=	../../interfaces/humanoid-nav-msgs

SYSTEM_SEARCH.humanoid-nav-msgs=\
  'include/humanoid_nav_msgs/ClipFootstep.h'				\
  'share/humanoid_nav_msgs/msg/StepTarget.msg'				\
  'share/humanoid_nav_msgs/cmake/humanoid_nav_msgsConfig.cmake'		\
  'share/humanoid_nav_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/humanoid_nav_msgs.pc:/Version/s/[^0-9.]//gp'

# for humanoid_nav_msgs-msg-paths.cmake
CMAKE_PREFIX_PATH.humanoid-nav-msgs=	${PREFIX.humanoid-nav-msgs}

endif # HUMANOID_NAV_MSGS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
