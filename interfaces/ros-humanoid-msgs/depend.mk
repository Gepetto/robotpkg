# robotpkg depend.mk for:	interfaces/ros-humanoid-msgs
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_HUMANOID_MSGS_DEPEND_MK:=	${ROS_HUMANOID_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-humanoid-msgs
endif

ifeq (+,$(ROS_HUMANOID_MSGS_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-humanoid-msgs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-humanoid-msgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-humanoid-msgs
ROS_DEPEND_USE+=		ros-humanoid-msgs

DEPEND_ABI.ros+=ros<=kinetic

DEPEND_ABI.ros-humanoid-msgs?=	ros-humanoid-msgs>=0.1
DEPEND_DIR.ros-humanoid-msgs?=	../../interfaces/ros-humanoid-msgs

SYSTEM_SEARCH.ros-humanoid-msgs=\
  'include/humanoid_nav_msgs/ClipFootstep.h'				\
  '${PYTHON_SYSLIBSEARCH}/humanoid_nav_msgs/msg/_ExecFootstepsAction.py'\
  'share/humanoid_nav_msgs/msg/StepTarget.msg'				\
  'share/humanoid_nav_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/humanoid_nav_msgs.pc:/Version/s/[^0-9.]//gp'

# There is a meta-pkg call ros-humanoid-msgs, which contains itself plus
# ros-humanoid-nav-msgs. Since the meta-pkg contains itself, installing it
# only installs ros-humanoid-msgs and not ros-humanoid-nav-msgs ...
#
SYSTEM_PKG.Ubuntu.ros-humanoid-msgs=\
  ros-${PKG_ALTERNATIVE.ros}-humanoid-msgs	\
  ros-${PKG_ALTERNATIVE.ros}-humanoid-nav-msgs

include ../../mk/sysdep/python.mk

endif # ROS_HUMANOID_MSGS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
