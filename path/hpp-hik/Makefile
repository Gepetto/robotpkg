# robotpkg Makefile for:	path/hpp-hik
# Created:			florent on Thu, 15 Oct 2009
#

DISTNAME=	hpp-hik-${VERSION}
PKGNAME=	hpp-hik-${VERSION}
VERSION=	2.0.1

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-hik/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-hik

MAINTAINER=	hpp@laas.fr
COMMENT=Solver of hierarchical linear inequality and equality constraints

USE_LANGUAGES+= c c++

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/hpp-hik

include ../../math/fsqp/depend.mk
include ../../path/hpp-gik/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
