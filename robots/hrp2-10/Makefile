# robotpkg Makefile for:	robots/hrp2-10
# Created:			Florent Lamiraux on Sat,  9 Jul 2011
#

DISTNAME=		hrp2-10-1.1
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2_10

MAINTAINER=	gepetto@laas.fr
COMMENT=	Data and functions specific to HRP2-10
LICENSE=	openhrp-grx-license

RESTRICTED=	Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hrp2-10

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
