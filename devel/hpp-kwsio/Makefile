# robotpkg Makefile for:	devel/hpp-kwsio
# Created:			Anthony Mallet on Fri, 13 Jul 2007
#

DISTNAME=	kwsio-${VERSION}
PKGNAME=	hpp-kwsio-${VERSION}
VERSION=	1.0.1

CATEGORIES=	devel
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}kwsIO
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Input and Output functions for KineoWorks(tm) package.

USE_LANGUAGES+=	c c++

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/kwsIO

include ../../path/kineo-pp/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/robotpkg.mk
