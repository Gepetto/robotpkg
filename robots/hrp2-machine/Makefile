# robotpkg Makefile for:	robots/hrp2-machine
# Created:			Olivier Stasse on Wed, 17 Jun 2015
#
VERSION=		1.0.2
DISTNAME=		hrp2-machine-${VERSION}
MASTER_SITES=		${MASTER_SITE_JRL}ros/${PKGBASE}/
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}robots/ros-hrp2/hrp2-machine

CATEGORIES=		robots
COMMENT=		Hrp2 machine description
MAINTAINER=		gepetto@laas.fr
LICENSE=		openhrp-grx-license

WRKSRC=			${WRKDIR}/hrp2_machine-${VERSION}

RESTRICTED=	Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib
DYNAMIC_PLIST_DIRS+=	share/doc/hrp2_machine

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
