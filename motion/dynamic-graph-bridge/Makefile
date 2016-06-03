# robotpkg Makefile for:	motion/dynamic-graph-bridge
# Created:			Aurelie Clodic on Mon, 16 Dec 2013
#

VERSION=	2.0.6
DISTNAME=	dynamic_graph_bridge-${VERSION}
PKGNAME=	dynamic-graph-bridge-${VERSION}

CATEGORIES=	motion
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=\
  ${MASTER_REPOSITORY_GITHUB}stack-of-tasks/dynamic_graph_bridge/

COMMENT=	Bridge between ROS and the dynamic-graph real-time control
LICENSE=	gnu-lgpl-v3
MAINTAINER=	hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/dynamic_graph_bridge

# disable -Werror because of x86_64 warnings (must be fixed upstream) and
# boost + gcc that don't cohabit well depending on their respective versions
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# man pages location
CMAKE_ARGS+=		-DMANDIR=${PREFIX}/${PKGMANDIR}
# library location
CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-realtime-tools/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../math/jrl-dynamics-urdf/depend.mk
include ../../motion/dynamic-graph-bridge-msgs/depend.mk
include ../../motion/dynamic-graph/depend.mk
include ../../motion/py-dynamic-graph/depend.mk
include ../../motion/sot-core/depend.mk
include ../../motion/sot-dynamic/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/bullet/depend.mk
include ../../sysutils/ros-rospack/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
