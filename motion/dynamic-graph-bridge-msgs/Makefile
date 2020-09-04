# robotpkg Makefile for:	motion/dynamic-graph-bridge-msgs
# Created:			Aurelie Clodic on Fri, 17 Oct 2014
#

ORG=			stack-of-tasks
NAME=			dynamic-graph-bridge-msgs
VERSION=		0.3.0

ROSNAME=		$(subst -,_,${NAME})
PKGNAME=		${NAME}-${VERSION}
DISTNAME=		${ROSNAME}-${VERSION}

CATEGORIES=		motion

COMMENT=		Dynamic graph bridge messages and services.
LICENSE=		2-clause-bsd
MAINTAINER=		hpp@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/${ROSNAME}

# disable -Werror because of x86_64 warnings (must be fixed upstream) and
# boost + gcc that don't cohabit well depending on their respective versions
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

# man pages location
CMAKE_ARGS+=		-DMANDIR=${PREFIX}/${PKGMANDIR}

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-genlisp/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
