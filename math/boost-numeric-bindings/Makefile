# robotpkg Makefile for:	math/boost-numeric-bindings
# Created:			Anthony Mallet on Tue,  9 Nov 2010
#

DISTNAME=		boost-numeric-bindings-20101109
CATEGORIES=		math
FETCH_METHOD=		svn
MASTER_SITES=		${boost_sandbox_svn}/numeric_bindings@66468
MASTER_REPOSITORY=	svn ${boost_sandbox_svn}/numeric_bindings
boost_sandbox_svn=	http://svn.boost.org/svn/boost/sandbox/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://beta.boost.org/community/sandbox.html
COMMENT=		C++ bindings for LAPACK and BLAS libraries.
LICENSE=		bsl
CONFLICTS+=		boost-numeric-bindings-v1

INSTALLATION_DIRS=	include/boost/numeric/bindings
NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../devel/boost-headers/depend.mk
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC}/boost/numeric/bindings &&	\
		${PAX} -rw -pm . ${PREFIX}/${INSTALLATION_DIRS}
