# robotpkg Makefile for:	architecture/genom3-ros
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

DISTNAME=	genom3-ros-1.31
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom3-ros/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genom3/genom3-ros

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/genom3-ros
COMMENT=	GenoM3 template for ros-based components

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-boost=${PREFIX.boost-headers}

include ../../architecture/genom3/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../lang/ros-gencpp/depend.mk
include ../../lang/ros-genpy/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
