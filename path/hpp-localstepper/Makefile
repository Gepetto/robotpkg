# robotpkg Makefile for:	path/hpp-localstepper
# Created:			florent on Fri, 16 Oct 2009
#

DISTNAME=	hpp-localstepper-${VERSION}
PKGNAME=	hpp-localstepper-${VERSION}
VERSION=	1.1.1

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-localstepper/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-localstepper

MAINTAINER=	hpp@laas.fr
COMMENT=	Whole-body motion planning for humanoid robot with steps

USE_LANGUAGES+= c c++

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/hpp-localstepper

include ../../path/hpp-hik/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
