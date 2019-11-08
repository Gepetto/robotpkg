# robotpkg Makefile for:	interfaces/humanoid-nav-msgs
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#

VERSION=		0.3.0
DISTNAME=		humanoid_msgs-${VERSION}
PKGNAME=		humanoid-nav-msgs-${VERSION}
CATEGORIES=		interfaces
MASTER_SITES=		${MASTER_SITE_GITHUB:=ahornung/humanoid_msgs/archive/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/ahornung/humanoid_msgs
DISTFILES=		${VERSION}${EXTRACT_SUFX}
DIST_SUBDIR=		${PKGBASE}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://github.com/ahornung/humanoid_msgs
COMMENT=		ROS messages and services for humanoid robots
LICENSE=		modified-bsd
CONFLICTS+=		ros-humanoid-msgs-[0-9]*

WRKSRC=			${WRKDIR}/humanoid_msgs-${VERSION}/humanoid_nav_msgs

include ../../devel/ros-catkin/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
