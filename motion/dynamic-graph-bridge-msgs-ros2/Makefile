# robotpkg Makefile for:	motion/ros2-dynamic-graph-bridge-msgs
# Created:			Anthony Mallet on Fri, 11 Aug 2023
#

ORG=			stack-of-tasks
NAME=			dynamic_graph_bridge_msgs
VERSION=		0.3.4
PKGNAME=		$(subst _,-,${NAME})-ros2-${VERSION}

COMMENT=		Dynamic graph bridge messages and services
LICENSE=		2-clause-bsd
MAINTAINER=		guilhem.saurel@laas.fr
CATEGORIES=		motion
CONFLICTS+=		$(subst _,-,${NAME})-[0-9]*

USE_MASTER_GITHUB=	yes
USE_PYTHON=		yes
include ../../devel/jrl-cmakemodules/Makefile.common

CONFIGURE_ENV+=		ROS_VERSION=2

include ../../devel/ament-cmake/depend.mk
include ../../interfaces/ros2-rosidl-defaults/depend.mk
include ../../sysutils/ros2-ros-workspace/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
