# robotpkg Makefile for:	simulation/mrsim-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		mrsim-gazebo-1.1
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for tk3-mikrokopter multi-rotors
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../devel/boost-libs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/libmrsim/depend.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
