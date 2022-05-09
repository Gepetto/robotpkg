# robotpkg Makefile for:	hardware/tk3-paparazzi
# Created:			Anthony Mallet on Tue, 18 May 2021
#

DISTNAME=	tk3-paparazzi-1.2
CATEGORIES=	hardware
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}
CHECKOUT_VCS_OPTS+=	--recursive

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/tk3-paparazzi
COMMENT=	Autopilot for the Paparazzi hardware
LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

# Don't set CC nor CPP, because this package has two configure scripts that
# look for different compilers. Instead, rely on PATH to let configure find
# the compilers.
CONFIGURE_ARGS+=		CC= CPP=
PATH.arm-none-eabi-gcc+=	bin
PATH.gcc+=			bin
PATH.clang+=			bin

# -O levels are defined by the source itself, don't interfere
C_COMPILER_FLAGS_NDEBUG=	-DNDEBUG

DEPEND_ABI.arm-none-eabi-gcc+=	arm-none-eabi-gcc>=4.9

include ../../mk/sysdep/arm-none-eabi-gcc.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
