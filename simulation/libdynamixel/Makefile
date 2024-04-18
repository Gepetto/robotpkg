# robotpkg Makefile for:	simulation/libdynamixel
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DISTNAME=		libdynamixel-1.2.1
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Emulation library for dynamixel motors
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
