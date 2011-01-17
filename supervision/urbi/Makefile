# robotpkg Makefile for:	supervision/urbi
# Created:			Thomas Moulard on Sun, 30 May 2010
#

DISTNAME=	urbi-sdk-${VERSION}
PKGNAME=	urbi-${VERSION}
VERSION=	2.0.2

CATEGORIES=	supervision
MASTER_SITES=	http://www.gostai.com/static/downloads/

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.gostai.com/
COMMENT=	Urbi middleware for robotics.
LICENSE=	gnu-agpl-v3

USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes

# Enable release mode.
CONFIGURE_ARGS+=	--enable-compilation-mode=speed
# Generate documentation.
CONFIGURE_ARGS+=	--enable-doc-sections=all

include ../../mk/sysdep/libjpeg.mk
include ../../mk/robotpkg.mk

# Remove local libjpeg header.
# For historical reason Urbi installs libjpeg headers.
# This is wrong. Let's remove them to avoid conflicts.
post-install:
	${RM} -f 			\
	"${PREFIX}/include/jconfig.h"	\
	"${PREFIX}/include/jerror.h"	\
	"${PREFIX}/include/jmorecfg.h"	\
	"${PREFIX}/include/jpeglib.h"
