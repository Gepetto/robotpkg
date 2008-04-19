#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: Makefile,v 1.7 2008/04/16 01:01:50 joerg Exp $
#

DISTNAME=	libfetch-2.4
CATEGORIES=	net
MASTER_SITES=	# empty
DISTFILES=	# empty

NO_CHECKSUM=	yes

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.FreeBSD.org/
COMMENT=	Library to access HTTP/FTP server
#LICENSE=	modified-bsd

BUILD_TARGET=	depend all
INSTALL_TARGET=	install includes

include options.mk

include ../../pkgtools/libnbcompat/depend.mk
include ../../mk/robotpkg.mk

do-extract:
	${CP} -Rp ${FILESDIR} ${WRKSRC}

