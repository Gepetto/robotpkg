# robotpkg depend.mk for:	sysutils/ros2-launch
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_LAUNCH_DEPEND_MK:=	${ROS2_LAUNCH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-launch
endif

ifeq (+,$(ROS2_LAUNCH_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-launch

DEPEND_ABI.ros2-launch?=ros2-launch>=0
DEPEND_DIR.ros2-launch?=../../sysutils/ros2-launch

SYSTEM_SEARCH.ros2-launch=\
  $(foreach _,						\
      launch						\
      launch_pytest					\
      launch_testing					\
      launch_xml					\
      launch_yaml,					\
    '${PYTHON_SYSLIBSEARCH}/$_/__init__.py'		\
    'share/$_/package.xml:/<version>/s/[^0-9.]//gp')	\

include ../../mk/sysdep/python.mk

endif # ROS2_LAUNCH_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
