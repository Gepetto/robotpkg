# robotpkg Makefile for:	devel/ros-ros
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	dynamic_reconfigure
ROS_VERSION=	1.5.32

CATEGORIES=	middleware
ROS_COMMENT=	runtime parameter configuration

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	cmake/*/*.py cmake/gendeps
SUBST_FILES.py-interp+=	scripts/reconfigure_gui scripts/dynparam
SUBST_FILES.py-interp+=	test/*.py

PYTHON_PLIST_COMPILE_PATTERN=\
  /share[\/]${ROS_PKG}[\/]cmake[\/].*[.]py$$/ || /lib[\/].*[.]py$$/

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/robotpkg.mk
