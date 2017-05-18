# robotpkg Makefile for:	sysutils/tk3-flash
# Created:			Anthony Mallet on Tue, 27 Jan 2015
#

DISTNAME=		tk3-flash-1.3.1
CATEGORIES=		sysutils
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=tk3-flash/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}tk3-flash

COMMENT=	Programming utility for Mikrokopter hardware
HOMEPAGE=	http://git.openrobots.org/projects/tk3-flash
LICENSE=	2-clause-bsd
MAINTAINER=	openrobots@laas.fr

GNU_CONFIGURE=	yes

include ../../mk/robotpkg.prefs.mk
ifeq (${OS_KERNEL},Linux)
  include ../../mk/sysdep/libudev.mk
endif

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/libelf.mk
include ../../mk/sysdep/libusb1.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
