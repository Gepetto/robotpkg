# robotpkg Makefile for:	robots/nao-robot
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#

VERSION=	0.2.2
PKGREVISION=	1
DISTNAME=	${VERSION}
PKGNAME=	nao-robot-${VERSION}
MASTER_SITES=	${MASTER_SITE_GITHUB:=ahornung/nao_robot/archive/}
DIST_SUBDIR=	${PKGBASE}

CATEGORIES=	robots
COMMENT=	Base ROS support for the Nao robot
LICENSE=	modified-bsd
HOMEPAGE=	http://wiki.ros.org/humanoid_msgs

ROS_METAPKG=	yes
WRKSRC=		${WRKDIR}/nao_robot-${VERSION}

CMAKE_ARGS+=	-DNAOqi_DIR=${PREFIX.naoqi}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	nao_driver/nodes/*.py

DEPEND_ABI.ros=	ros>=groovy

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-xacro/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-humanoid-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../localization/ros-robot-state-publisher/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../middleware/naoqi/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../sysutils/ros-diagnostics/depend.mk

include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/python.mk

include ../../mk/robotpkg.mk
