# robotpkg Makefile for:	path/hpp-gik
# Created:			Anthony Mallet on Thu, 28 Jun 2007
#

DISTNAME=	hpp-gik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	2.6.2

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-gik/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-gik

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

GNU_CONFIGURE=		yes
USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-gik

include ../../interfaces/jrl-interface-giktask/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../math/hrp2-dynamics/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
