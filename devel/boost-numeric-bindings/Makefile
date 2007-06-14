# $NetBSD: Makefile.common,v 1.9 2006/11/10 17:41:13 tv Exp $
#

DISTNAME=		boost-numeric-bindings-20070129
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_ROBOTPKG}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/boost-sandbox
COMMENT=		C++ bindings for LAPACK and BLAS libraries.

DEPENDS+=		boost>=1.33.1:../../devel/boost

WRKSRC=			${WRKDIR}/boost
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} &&	${PAX} -rw -pm . ${PREFIX}/include/boost
