# $NetBSD$
#

DISTNAME=		libdc1394-2.0.1
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=libdc1394/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://sourceforge.net/projects/libdc1394/
COMMENT=		Programming interface to control IEEE 1394 based cameras 

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=    libdc1394-2.pc.in

CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib

DEPENDS+=		libraw1394>=1.2.0:../../image/libraw1394

include ../../mk/robotpkg.mk
