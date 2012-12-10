# robotpkg Makefile for:	devel/catkin
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

ROS_PKG=		catkin
ROS_VERSION=		0.4.5
PKGNAME=		${ROS_PKG}-${ROS_VERSION}

CATEGORIES=		devel
ROS_COMMENT=		low-level build system macros and infrastructure
HOMEPAGE=		http://www.ros.org/wiki/catkin

include ../../meta-pkgs/ros-base/Makefile.common

CMAKE_ARGS+=-DPYTHON_PACKAGES_DIR=site-packages

CMAKE_ARGS+=-DGTEST_ROOT=${PREFIX.googletest}
CMAKE_ARGS+=-Dnosetests_path=${NOSETESTS}

SUBST_CLASSES+=			py-interp
SUBST_FILES.py-interp+=		bin/catkin-bump-version
SUBST_FILES.py-interp+=		bin/catkin-parse-stack
SUBST_FILES.py-interp+=		bin/catkin-topological-order
SUBST_FILES.py-interp+=		bin/catkin-version
SUBST_FILES.py-interp+=		bin/catkin_install_parse

SUBST_CLASSES+=			bash-interp
SUBST_FILES.bash-interp+=	bin/git-catkin
SUBST_FILES.bash-interp+=	bin/git-catkin-track-all

include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/bash.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-empy.mk
include ../../mk/sysdep/py-nose.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/robotpkg.mk
