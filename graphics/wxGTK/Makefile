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

PATCHFILES=		${DISTNAME}-libtool.diff2.bz2
PATCH_SITES=		${MASTER_SITE_NETBSD_PKGSRC}

USE_LIBTOOL=		yes
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-gtk=2
CONFIGURE_ARGS+=	--with-opengl
CONFIGURE_ARGS+=	--disable-unicode
PLIST_SUBST+=		BUILDTYPE=ansi

DOCDIR=			${PREFIX}/share/doc/wxGTK
MAKE_ENV+=              PKGLOCALEDIR=${PKGLOCALEDIR}

include ../../mk/robotpkg.mk

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENCE.txt ${DOCDIR}/LICENSE
