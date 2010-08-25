# robotpkg Makefile for:	path/hpp-gik
# Created:			Anthony Mallet on Thu, 28 Jun 2007
#

DISTNAME=	hpp-gik-${VERSION}
PKGNAME=	hpp-gik-${VERSION}
VERSION=	2.7

CATEGORIES=	path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=hpp-gik/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}algo/hpp-gik
LICENSE=	gnu-lgpl-v3

MAINTAINER=	gepetto@laas.fr
#HOMEPAGE=	
COMMENT=	Generalized Inverse Kinematics for humanoid robots.

USE_LANGUAGES+=		c c++
DOXYGEN_PLIST_DIR+=	share/doc/hpp-gik
CMAKE_ARGS+=	-DDISABLE_TEST=YES

include ../../interfaces/jrl-interface-giktask/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
