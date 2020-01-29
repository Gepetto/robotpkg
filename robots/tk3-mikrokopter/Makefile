# robotpkg Makefile for:	robots/tk3-mikrokopter
# Created:			Anthony Mallet on Wed, 11 Feb 2015
#

DISTNAME=	tk3-mikrokopter-1.8.5
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=tk3-mikrokopter/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}tk3-mikrokopter

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/tk3-mikrokopter
COMMENT=	Autopilot for the Mikrokopter hardware
LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

DEPEND_ABI.avr-gcc+= avr-gcc>=4.6

# -O3 generates code that exceeds the flash size on the brushless controller.
# -Os is enable by default in the package, as well as other optimization flags
C_COMPILER_FLAGS_NDEBUG=	-DNDEBUG

include ../../mk/sysdep/avr-libc.mk
include ../../mk/language/avr-c.mk
include ../../mk/robotpkg.mk
