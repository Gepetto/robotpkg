# $NetBSD: Makefile,v 1.4 2006/12/01 14:03:02 joerg Exp $
#

DISTNAME=		opencv-1.0.0
CATEGORIES=		image devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=opencvlibrary/}
PKGREVISION=		4

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://opencvlibrary.sourceforge.net/
COMMENT=		Library for computer vision problems

USE_PKGLOCALEDIR=	yes
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

# ffmpeg raises a compilation problem. Deactivate for now.
CONFIGURE_ARGS+=	--without-ffmpeg

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk
