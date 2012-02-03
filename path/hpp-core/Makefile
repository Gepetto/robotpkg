# robotpkg Makefile for:	path/hpp-core
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

DISTNAME=	hpp-core-${VERSION}
PKGNAME=	hpp-core-${VERSION}
VERSION=	2.3
PKGREVISION=

CATEGORIES=	path
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}/algo/hpp-core

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=	
COMMENT=	Basic classes used as interfaces with KineoWorks(tm).
LICENSE=	cnrs-hpp-closed-source

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/hpp-core

# --- options --------------------------------------------------------

# --------------------------------------------------------------------

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../devel/hpp-model/depend.mk
include ../../devel/hpp-kwsplus/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
