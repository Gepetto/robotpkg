# robotpkg Makefile for:	devel/asio
# Created:			Anthony Mallet on Tue, 24 May 2022
#

DISTNAME=	asio-1.22.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=asio/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	http://think-async.com/
COMMENT=	Header-only C++ library for asynchronous programming
LICENSE=	bsl

NO_CONFIGURE=	yes
NO_BUILD=	yes

INSTALLATION_DIRS=	include

include ../../archivers/pax/depend.mk
include ../../mk/robotpkg.mk

do-install:
	cd ${WRKSRC} && \
	  ${FIND} include -name "*.*pp" | ${PAX} -r -w  ${DESTDIR}${PREFIX}
