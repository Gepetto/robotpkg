# robotpkg Makefile for:	simulation/dxsim-gazebo
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DISTNAME=		dxsim-gazebo-1.2
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for Dynamixel motors
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/libdynamixel/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
