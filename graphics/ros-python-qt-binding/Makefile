# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

PKGREVISION=	1
ROS_PKG=	python_qt_binding
ROS_VERSION=	0.2.10
ROS_REPO=	ros-visualization

CATEGORIES=	graphics
ROS_COMMENT=	python bindings for Qt

include ../../meta-pkgs/ros-base/Makefile.common

# Configure path to programs
SUBST_CLASSES+=		sip-path
SUBST_STAGE.sip-path=	pre-configure
SUBST_MESSAGE.sip-path=	Configuring sip path
SUBST_SED.sip-path+=	-e 's|@SIP@|${SIP}|'
SUBST_SED.sip-path+=	-e 's|@MAKE@|${MAKE}|'
SUBST_FILES.sip-path+=	cmake/sip_helper.cmake

# Replace python interpreter in source files
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	src/python_qt_binding/*.py

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../mk/sysdep/py-qt4.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/robotpkg.mk
