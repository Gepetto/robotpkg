# robotpkg Makefile for:	devel/ros2-rcutils
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

ROS2_PKG=	rcutils
ROS2_VERSION=	5.1.1

CATEGORIES=	devel
ROS2_COMMENT=	common C functions and data structures.

include ../../meta-pkgs/ros2-core/Makefile.common

# Force cmake to find exact python version
SUBST_CLASSES+=	py-vers
SUBST_STAGE.py-vers=	pre-configure
SUBST_MESSAGE.py-vers=	Forcing exact python version search
SUBST_SED.py-vers=\
  -e 's|package(Python3 REQ|package(Python3 ${PYTHON_VERSION} EXACT REQ|'
SUBST_FILES.py-vers=	CMakeLists.txt

include ../../devel/ament-cmake-ros/depend.mk
include ../../mk/sysdep/py-empy.mk
include ../../mk/robotpkg.mk
