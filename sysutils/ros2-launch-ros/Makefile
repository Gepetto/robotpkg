# robotpkg Makefile for:	sysutils/ros2-launch-ros
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

ROS2_PKG=	launch_ros
ROS2_VERSION=	0.19.2

CATEGORIES=	sysutils
ROS2_COMMENT=	tools for launching ROS nodes

ROS2_SUBPKGS=\
  python:			\
    launch_ros			\
    launch_testing_ros		\
    ros2launch			\
    test_launch_ros

include ../../meta-pkgs/ros2-core/Makefile.common

# runtime needs:
# importlib-metadata for python<3.8
include ../../mk/sysdep/python.mk
define PKG_ALTERNATIVE_SET.python36+=

  include ../../mk/sysdep/py-importlib-metadata.mk
endef
define PKG_ALTERNATIVE_SET.python37+=

  include ../../mk/sysdep/py-importlib-metadata.mk
endef

include ../../devel/py-osrf-pycommon/depend.mk
include ../../devel/ros2-rclpy/depend.mk
include ../../interfaces/ros2-rcl-interfaces/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../sysutils/ros2-launch/depend.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/robotpkg.mk
