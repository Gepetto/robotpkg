# robotpkg Makefile for:	simulation/optitrack-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		optitrack-gazebo-1.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for OptiTrack Motion Capture
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
