# robotpkg Makefile for:	lang/ros-genpy
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		genpy
ROS_VERSION=		0.4.12

CATEGORIES=		lang
ROS_COMMENT=		python code generator for ROS .msg format

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/gen*_py.py

PYTHON_PLIST_COMPILE_PATTERN=/genpy[\/].*[.]py$$/


include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
