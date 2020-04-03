# robotpkg Makefile for:	devel/catkin
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

PKGREVISION=	1
ROS_PKG=	catkin
ROS_VERSION=	0.7.16
PKGNAME=	${PKGTAG.python}-ros-$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=	devel
ROS_COMMENT=	low-level build system macros and infrastructure

CONFLICTS+=	py[0-9][0-9]-catkin-[0-9]*
# old package name
CONFLICTS+=	catkin-[0-9]*

include ../../meta-pkgs/ros-base/Makefile.common

MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

DEPEND_ABI.cmake+= cmake>=2.8.3

CMAKE_ARGS+=-DGTEST_ROOT=${PREFIX.googletest}
CMAKE_ARGS+=-DNOSETESTS=${NOSETESTS}
CMAKE_ARGS+=-DCMAKE_PREFIX_PATH=${PREFIX}
CMAKE_ARGS+=-DSETUPTOOLS_DEB_LAYOUT=OFF

SUBST_CLASSES+=			catkin
SUBST_STAGE.catkin=		pre-configure
SUBST_MESSAGE.catkin=		Replacing installation prefix
SUBST_SED.catkin+=		-e 's|@PREFIX@|${PREFIX}|'
SUBST_FILES.catkin+=		python/catkin/workspace.py

SUBST_CLASSES+=			py-interp
SUBST_FILES.py-interp+=		bin/catkin_*
SUBST_FILES.py-interp+=		cmake/*.py cmake/*/*.py cmake/*/*.py.in
SUBST_FILES.py-interp+=		doc/*.py
SUBST_FILES.py-interp+=		test/*/*.py

SUBST_CLASSES+=			bash-interp
SUBST_FILES.bash-interp+=	cmake/templates/*.bash.in

# INSTALL script keeping track of ${PREFIX}/.catkin file
INSTALL_VARS+=	ECHO CHMOD CP FIND GREP MKDIR RM TEST
INSTALL_SRC+=	${FILESDIR}/catkin
DEINSTALL_SRC+=	${FILESDIR}/catkin

DEPEND_ABI.py-catkin-pkg+= ${PKGTAG.python}-catkin-pkg>=0.4.3

include ../../sysutils/py-catkin-pkg/depend.mk
include ../../mk/sysdep/bash.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-empy.mk
include ../../mk/sysdep/py-nose.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
