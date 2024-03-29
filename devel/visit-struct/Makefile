# robotpkg Makefile for:	devel/visit-struct
# Created:			Guilhem Saurel on Mon, 10 Oct 2022
#

ORG=		garbageslam
NAME=		visit_struct
VERSION=	1.0

GITHUB_TAG=	v${VERSION}
DISTNAME=	${NAME}-${VERSION}
PKGNAME=	$(subst _,-,${DISTNAME})

MASTER_SITES=	${MASTER_SITE_GITHUB:=${ORG}/}

CATEGORIES=	devel
COMMENT=	A miniature library for struct-field reflection in C++
LICENSE=	bsl
MAINTAINER=	gsaurel@laas.fr

# This uses meson. Support could be added in mk/configure/meson.mk.
# include ../../mk/sysdep/meson.mk
# For now, just do with custom install rules as this is a header-only library.
NO_BUILD=		yes
INSTALLATION_DIRS=	include/${NAME}

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN}${INSTALL_DATA} \
	  ${WRKSRC}/include/${NAME}/*.hpp ${PREFIX}/include/${NAME}/.
