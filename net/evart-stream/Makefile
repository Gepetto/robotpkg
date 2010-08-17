# robotpkg Makefile for:	net/evart-stream
# Created:			Anthony Mallet on Tue, 15 Jul 2008
#

VERSION=		2.0
DISTNAME=		evart-stream-${VERSION}

CATEGORIES=		net
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=evart/}

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet/soft/mocap/evart-stream
COMMENT=		EVa Real-Time Software data streaming server.
LICENSE=		2-clause-bsd

PREFIX=			${LOCALBASE}/i386-mingw32
COMPILER_TARGET=	i386-mingw32

GNU_CONFIGURE=          yes
CONFIGURE_ARGS+=	--with-sdk-include=${PREFIX.cortex-sdk}/include
CONFIGURE_ARGS+=	--with-sdk-lib=${PREFIX.cortex-sdk}/bin

DEPEND_METHOD.evart-client+=	build
include ../../net/evart-client/depend.mk

include ../../devel/cortex-sdk/depend.mk
include ../../mk/robotpkg.mk
