# robotpkg Makefile for:	sysutils/arduio
# Created:			Anthony Mallet on Wed,  1 Mar 2017
#

DISTNAME=	arduio-1.0
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/arduio
COMMENT=	Remote control I/Os of an Arduino board
LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes

DEPEND_ABI.avr-gcc+= avr-gcc>=4.6
C_COMPILER_FLAGS_NDEBUG=	-O2 -DNDEBUG

include ../../mk/sysdep/avr-libc.mk
include ../../mk/language/avr-c.mk
include ../../mk/robotpkg.mk
