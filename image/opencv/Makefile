# $NetBSD: Makefile,v 1.4 2006/12/01 14:03:02 joerg Exp $
#

DISTNAME=		opencv-1.0.0
CATEGORIES=		image devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=opencvlibrary/}
PKGREVISION=		3

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencvlibrary.sourceforge.net/
COMMENT=		Library for computer vision problems

USE_PKGLOCALEDIR=	yes
USE_LIBTOOL=		yes
INSTALLATION_DIRS+=	share/doc/opencv/papers share/doc/opencv/ref/pics \
			share/opencv/haarcascades

GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	opencv.pc.in

SUBST_CLASSES+=		py
SUBST_STAGE.py=		pre-configure
SUBST_FILES.py=		samples/python/*.py
SUBST_SED.py=		-e 's,/usr/bin/python,/usr/bin/env python,'

CONFIGURE_ARGS+=	--without-swig
CONFIGURE_ARGS+=	--without-python
CONFIGURE_ARGS+=	--without-1394libs

include ../../mk/robotpkg.mk
