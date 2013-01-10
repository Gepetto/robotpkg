# robotpkg Makefile for:	graphics/Togl
# Created:			Matthieu Herrb on Thu, 23 Jul 2009
#
PKGNAME=	Togl-${PKGVERSION}
DISTNAME=	Togl${PKGVERSION_NOREV}-src
PKGVERSION=	2.0

CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=togl/}

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://togl.sourceforge.net/
COMMENT=	a Tk OpenGL widget
LICENSE=	isc

WRKSRC=		${WRKDIR}/${DISTNAME:-src=}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--exec-prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=	--with-tk=$(dir ${TK_CONFIG_SH})

INCLUDE_DIRS.mesa+=include

include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
