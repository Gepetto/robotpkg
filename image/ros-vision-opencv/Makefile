# robotpkg Makefile for:	image/ros-vision-opencv
# Created:			Anthony Mallet on Wed, 26 Jun 2013
#

ROS_PKG=		vision_opencv
ROS_METAPKG=		yes
ROS_VERSION=		1.11.4
ROS_REPO=		ros-perception

CATEGORIES=		image
ROS_COMMENT=		interface with OpenCV

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	opencv_tests/nodes/*.py

USE_BOOST_LIBS+=python

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../image/opencv/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
