# robotpkg Makefile for:	image/ros-vision-opencv
# Created:			Anthony Mallet on Wed, 26 Jun 2013
#

ROS_PKG=		vision_opencv
ROS_METAPKG=		yes
ROS_VERSION=		1.11.12
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

CXXFLAGS+= -std=c++0x
include ../../mk/robotpkg.prefs.mk
ifeq (OpenNao,${OPSYS})
  ifneq (,$(filter 2.1.%,${OS_VERSION}))
    # this is required for gcc<=4.5 and boost>=1.55
    CXXFLAGS+=-DBOOST_NO_DEFAULTED_FUNCTIONS
  endif
endif

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../image/opencv/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../mk/robotpkg.mk
