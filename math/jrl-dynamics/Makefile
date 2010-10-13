# robotpkg Makefile for:	math/jrl-dynamics
# Created:			Anthony Mallet on Mon, 14 May 2007
#

DISTNAME=	dynamicsjrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.17.0

CATEGORIES=	math
NO_PUBLIC_SRC=	yes
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-dynamics/}
MASTER_REPOSITORY=	git@github.com:jrl-umi3218/jrl-dynamics.git

MAINTAINER=	openrobots@laas.fr
COMMENT=	JRL-Japan implementation of dynamic robot.
LICENSE=	gnu-lgpl-v3

USE_LANGUAGES+=	c c++

DOXYGEN_PLIST_DIR+=	share/doc/dynamicsJRLJapan

include ../../interfaces/jrl-mal/depend.mk
include ../../interfaces/jrl-interface-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/robotpkg.mk
