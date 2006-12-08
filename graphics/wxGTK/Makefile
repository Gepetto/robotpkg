# Copyright (c) 2006 LAAS/CNRS                         -- Fri Dec  8 2006
# All rights  reserved.
#

DISTNAME=		wxGTK-2.6.3
CATEGORIES=		graphics
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=wxwindows/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.wxwidgets.org/
COMMENT=		GTK-based implementation of the wxWidgets GUI library

#PATCHFILES=		${DISTNAME}-libtool.diff2.bz2
#PATCH_SITES=		${MASTER_SITE_LOCAL}

USE_LIBTOOL=		yes
GNU_CONFIGURE=		YES
USE_GNU_CONFIGURE_HOST=	no
CONFIGURE_ARGS+=	--with-gtk=2
CONFIGURE_ARGS+=	--with-libjpeg=sys
CONFIGURE_ARGS+=	--with-libpng=sys
CONFIGURE_ARGS+=	--with-libtiff=sys
CONFIGURE_ARGS+=	--with-opengl
CONFIGURE_ARGS+=	--with-zlib=sys
CONFIGURE_ARGS+=	--with-regex=builtin

CONFIGURE_ARGS+=	--disable-unicode
PLIST_SUBST+=		BUILDTYPE=ansi

CPPFLAGS+=		-Dunix=1	# src/common/unzip.c needs this

DOCDIR=			${PREFIX}/share/doc/wxGTK

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENCE.txt ${DOCDIR}/LICENSE

include ../../mk/robotpkg.mk
