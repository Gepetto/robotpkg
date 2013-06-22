# robotpkg Makefile for:	lang/ros-gencpp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		gencpp
ROS_VERSION=		0.4.13

CATEGORIES=		lang
ROS_COMMENT=		C++ code generator for ROS .msg format
HOMEPAGE=		http://www.ros.org/wiki/roscpp

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/gen_cpp.py

PYTHON_PLIST_COMPILE_PATTERN=/gencpp[\/].*[.]py$$/

include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
