# robotpkg Makefile for:	lang/ros-geneus
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

ROS_PKG=		geneus
ROS_VERSION=		3.0.0
ROS_REPO=		jsk-ros-pkg

CATEGORIES=		lang
ROS_COMMENT=		EusLisp message and service generators

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/gen*_py.py

PYTHON_PLIST_COMPILE_PATTERN=/geneus[\/].*[.]py$$/


include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
