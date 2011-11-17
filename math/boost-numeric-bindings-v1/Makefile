# robotpkg Makefile for:	math/boost-numeric-bindings
# Created:			Anthony Mallet on Mon, 29 Jan 2007
#

DISTNAME=		boost-numeric-bindings-20100322
PKGNAME=		boost-numeric-bindings-v1-20100322
CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=\
  svn \
  http://svn.boost.org/svn/boost/sandbox/numeric_bindings-v1/boost/numeric/bindings

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://beta.boost.org/community/sandbox.html
COMMENT=		C++ bindings for LAPACK and BLAS libraries.
LICENSE=		bsl
CONFLICTS+=		boost-numeric-bindings

INSTALLATION_DIRS=	include/boost/numeric/bindings

WRKSRC=			${WRKDIR}/boost
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../devel/boost-headers/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && ${PAX} -rw -pm . ${PREFIX}/${INSTALLATION_DIRS}
