# robotpkg Makefile for:	lang/ros-gennodejs
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

ROS_PKG=		gennodejs
ROS_VERSION=		2.0.1
ROS_REPO=		RethinkRobotics-opensource

CATEGORIES=		lang
ROS_COMMENT=		JavaScript message generators

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/gen*_py.py

PYTHON_PLIST_COMPILE_PATTERN=/gennodejs[\/].*[.]py$$/

SUBST_CLASSES+=		py-distsetup

include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
