# robotpkg Makefile for:	robots/hrp2_14
# Created:			florent on Wed, 10 Oct 2007
#

DISTNAME=		hrp2-14-1.8
CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2_14
PKGREVISION=			1

MAINTAINER=	gepetto@laas.fr
COMMENT=	Data and functions specific to HRP2-14.
LICENSE=	openhrp-grx-license

RESTRICTED=	Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hrp2-14

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
