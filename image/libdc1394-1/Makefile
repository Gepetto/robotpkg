# robotpkg Makefile for:	devel/libdc1394_1
# Created:			Anthony Mallet on Mon, 24 Sep 2007
#
PKGVERSION=		1.2.1
DISTNAME=		libdc1394-${PKGVERSION_NOREV}
PKGNAME=		libdc1394_1-${PKGVERSION}
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=libdc1394/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/libdc1394/
COMMENT=		Programming interface to control IEEE 1394 based cameras
LICENSE=		gnu-lgpl-v2.1

ONLY_FOR_PLATFORM=	Linux-% Darwin-%-i386

GNU_CONFIGURE=		yes

CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

include ../../image/libraw1394/depend.mk
include ../../mk/robotpkg.mk
