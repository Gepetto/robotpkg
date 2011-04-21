# robotpkg Makefile for:	robots/hrp2-builder
# Created:			florent on Fri, 30 Oct 2009
#

DISTNAME=	robotbuilder-${PKGVERSION}
PKGNAME=	hrp2-builder-${PKGVERSION}
PKGVERSION=	1.0.7
PKGREVISION=

CATEGORIES=		robots
MASTER_SITES=		${MASTER_SITE_JRL}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/robotbuilder

MAINTAINER=	hpp-source@laas.fr
#HOMEPAGE=
COMMENT=	Function that builds an instance of HRP2.
LICENSE=	openhrp-grx-license

RESTRICTED=	Redistribution not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/robotbuilder

GNU_CONFIGURE=	yes

include ../../robots/hrp2-14/depend.mk
include ../../devel/hpp-model/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
