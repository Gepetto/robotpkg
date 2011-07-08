# robotpkg Makefile for:	robots/hrp2_14
# Created:			florent on Wed, 10 Oct 2007
#

DISTNAME=	hrp2-10-1.1

CATEGORIES=	robots
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}hrp2_10

MAINTAINER=	gepetto@laas.fr
COMMENT=	Data and functions specific to HRP2-10.
LICENSE=	isc

USE_LANGUAGES+=	c c++
DOXYGEN_PLIST_DIR+=	share/doc/hrp2-10

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
