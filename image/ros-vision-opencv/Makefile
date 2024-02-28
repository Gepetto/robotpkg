# robotpkg Makefile for:	image/ros-vision-opencv
# Created:			Anthony Mallet on Wed, 26 Jun 2013
#

ROS_PKG=		vision_opencv
ROS_METAPKG=		yes
ROS_VERSION=		1.13.0
ROS_REPO=		ros-perception

CATEGORIES=		image
ROS_COMMENT=		interface with OpenCV

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+= cv_bridge/test/enumerants.py
SUBST_FILES.py-interp+= cv_bridge/setup.py
SUBST_FILES.py-interp+=	image_geometry/setup.py
SUBST_FILES.py-interp+=	opencv_apps/cfg/*.cfg
SUBST_FILES.py-interp+=	opencv_tests/nodes/*.py

USE_BOOST_LIBS+=python

Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

DEPEND_ABI.opencv = opencv>=3

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../image/opencv/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../sysutils/ros-console/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/robotpkg.mk
