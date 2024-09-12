# robotpkg Makefile for:	graphics/gdhe
# Created:			Arnaud Degroote on Sat, 17 May 2008
#

DISTNAME=	gdhe-3.8.5
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gdhe/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}gdhe
CHECKOUT_OPTS= -r gdhe-3.8-branch

MAINTAINER=	matthieu@laas.fr
HOMEPAGE=	https://git.openrobots.org/projects/gdhe/wiki/Wiki
COMMENT=	3D Visualization tools

LICENSE=	2-clause-bsd

MAKE_JOBS_SAFE=	no

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})
CONFIGURE_ARGS+=--with-jpeg=${PREFIX.libjpeg}
CONFIGURE_ARGS+=--x-includes=${PREFIX.libX11}/include
CONFIGURE_ARGS+=--x-libraries=${PREFIX.libX11}/lib

DEPEND_ABI.tcl= tcl>=8.6
DEPEND_ABI.tk=  tk>=8.6

INCLUDE_DIRS.mesa+=include

CFLAGS+=	-Wno-error=implicit-function-declaration
CFLAGS+=	-Wno-error=incompatible-pointer-types

include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libXmu.mk
include ../../mk/sysdep/libXpm.mk
include ../../mk/sysdep/swig.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/rpc.mk
include ../../mk/robotpkg.mk
