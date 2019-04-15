# robotpkg Makefile for:	sysutils/hrp2-computer-monitor
# Created:			Olivier Stasse on Wed, 17 Jun 2015
#

VERSION=		1.0.2
DISTNAME=		hrp2-computer-monitor-${VERSION}
MASTER_SITES=		${MASTER_SITE_JRL}ros/${PKGBASE}/
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}robots/ros-hrp2/${PKGBASE}

CATEGORIES=		sysutils
COMMENT=		Hrp2 ros monitoring package
MAINTAINER=		gepetto@laas.fr
LICENSE=		openhrp-grx-license

RESTRICTED=	Redistribution of repackaged binaries not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

WRKSRC=			${WRKDIR}/hrp2_computer_monitor-${VERSION}

DYNAMIC_PLIST_DIRS+=	share/doc/hrp2_computer_monitor

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
