# robotpkg depend.mk for:	sysutils/ros2-launch-ros
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
      launch_ros					\
      ros2launch,					\
    '${PYTHON_SYSLIBSEARCH}/$_/__init__.py'		\
    'share/$_/package.xml:/<version>/s/[^0-9.]//gp')	\

include ../../devel/py-osrf-pycommon/depend.mk
include ../../mk/sysdep/python.mk

# runtime needs:
# importlib-metadata for python<3.8
define PKG_ALTERNATIVE_SET.python36+=

  include ../../mk/sysdep/py-importlib-metadata.mk
endef
define PKG_ALTERNATIVE_SET.python37+=

  include ../../mk/sysdep/py-importlib-metadata.mk
endef

endif # ROS2_LAUNCH_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
