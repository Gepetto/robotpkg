# robotpkg Makefile for:	graphics/wxGTK
# Created:			Anthony Mallet on Fri, 8 Dec 2006
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

USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-gtk=2
CONFIGURE_ARGS+=	--with-opengl
CONFIGURE_ARGS+=	--disable-unicode
PLIST_SUBST+=		BUILDTYPE=ansi

DOCDIR=			${PREFIX}/share/doc/wxGTK
MAKE_ENV+=              PKGLOCALEDIR=${PKGLOCALEDIR}

include ../../pkgtools/libtool/depend.mk
include ../../mk/robotpkg.mk

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKSRC}/LICENCE.txt ${DOCDIR}/LICENSE
