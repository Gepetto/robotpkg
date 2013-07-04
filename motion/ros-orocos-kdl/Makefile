# robotpkg Makefile for:	motion/ros-orocos-kdl
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

ROS_PKG=	orocos_kdl
ROS_METAPKG=	yes
ROS_VERSION=	1.1.99
ROS_GITTAG=	0f75b5c73cce829c62018247a6b5206f48cb22df
ROS_REPO=	ros-gbp
ROS_PKGURL?=	${ROS_PKG}-release/archive/${ROS_GITTAG}${EXTRACT_SUFX}?file=

CATEGORIES=	motion
ROS_COMMENT=	Kinematics and Dynamics Library from Orocos

include ../../meta-pkgs/ros-base/Makefile.common

WRKSRC=		${WRKDIR}/${ROS_PKG}-release-$(subst /,-,${ROS_GITTAG})

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	orocos_kdl/tests/PyKDLtest.py

include ../../devel/ros-catkin/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/sysdep/cppunit.mk
include ../../mk/robotpkg.mk
