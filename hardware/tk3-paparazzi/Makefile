# robotpkg Makefile for:	hardware/tk3-paparazzi
# Created:			Anthony Mallet on Tue, 18 May 2021
#

DISTNAME=	tk3-paparazzi-1.1
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/tk3-paparazzi
COMMENT=	Autopilot for the Paparazzi hardware
LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

# -O levels are defined by the source itself, don't interfere
C_COMPILER_FLAGS_NDEBUG=	-DNDEBUG

include ../../mk/language/arm-none-eabi-c.mk
include ../../mk/robotpkg.mk
