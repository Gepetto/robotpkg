# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

ROS_PKG=		ros-comm
ROS_VERSION=		1.8.15
PKGNAME=		${ROS_PKG}-${ROS_VERSION}

CATEGORIES=		middleware
ROS_COMMENT=		communications-related libraries and tools
HOMEPAGE=		http://www.ros.org/wiki/ros_comm

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/catkin/depend.mk
include ../../devel/log4cxx/depend.mk
include ../../devel/ros-core/depend.mk
include ../../devel/roscpp-core/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-langs-dev/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/apr.mk
include ../../mk/sysdep/py-paramiko.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
