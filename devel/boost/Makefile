# $NetBSD: Makefile.common,v 1.9 2006/11/10 17:41:13 tv Exp $
#

BOOST_VERSION=		1.33.1
PKGNAME=		boost-${BOOST_VERSION}
DISTNAME=		boost_$(subst .,_,${BOOST_VERSION})
CATEGORIES=		devel

MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=boost/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.boost.org/
COMMENT=		Free, peer-reviewed portable C++ source libraries.

# We can't do this at post-extract because the extract cookie will get a
# future timestamp than the sources.  If this happens, print-PLIST does
# not work.
#pre-configure:
#	@cd ${WRKSRC} && ${FIND} . -type f -print | ${XARGS} ${TOUCH}

## Generate a new user.hpp or use the installed one, depending on the
## package we are building.
#do-configure:
#	@cd ${WRKSRC}/libs/config && \
#	    ${SETENV} ${CONFIGURE_ENV} ${SH} ./configure
#	${CP} -f ${WRKSRC}/libs/config/user.hpp ${WRKSRC}/boost/config/user.hpp

#boost-install-libs:
#	cd ${WRKSRC}/stage/lib && ${PAX} -rwpe libboost* ${PREFIX}/lib

include ../../mk/robotpkg.mk
