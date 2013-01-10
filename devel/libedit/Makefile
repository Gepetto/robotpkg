# robotpkg Makefile for:	devel/libedit
# Created:			Anthony Mallet on Tue, 13 Mar 2007
#

DISTNAME=		libedit-20110227-3.0
PKGNAME=		libedit-3.0
PKGREVISION=		20110227
CATEGORIES=		devel
MASTER_SITES=		http://www.thrysoee.dk/editline/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.thrysoee.dk/editline/
COMMENT=		Generic line editing and history functions.

LICENSE=		modified-bsd

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-widec

include ../../mk/sysdep/termcap.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
