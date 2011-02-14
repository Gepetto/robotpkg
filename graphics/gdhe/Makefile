# robotpkg Makefile for:	graphics/gdhe
# Created:			Arnaud Degroote on Sat, 17 May 2008
#

DISTNAME=	gdhe-3.8.1
PKGREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gdhe/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/gdhe.git
CHECKOUT_OPTS= -r gdhe-3.8-branch



MAINTAINER=	matthieu@laas.fr
HOMEPAGE=	https://softs.laas.fr/openrobots/wiki/gdhe
COMMENT=	3D Visualization tools

LICENSE=	2-clause-bsd

MAKE_JOBS_SAFE=	no
USE_LANGUAGES+= c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/robotpkg.mk
