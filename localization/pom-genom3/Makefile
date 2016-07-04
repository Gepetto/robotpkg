# robotpkg Makefile for:	localization/pom-genom3
# Created:			Anthony Mallet on Mon, 21 Mar 2016
#

DISTNAME=		pom-genom3-2.1
CATEGORIES=		localization
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		State estimation combining multiple independent sources
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

include ../../interfaces/openrobots-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
