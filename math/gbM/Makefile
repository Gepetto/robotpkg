# robotpkg Makefile for:	math/gbM
# Created:			Xavier Broquere on Tue, 10 Mar 2009
#

DISTNAME=	gbM-0.7
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=gbM/}
MASTER_REPOSITORY= git ssh://trac.laas.fr/git/robots/gbM

MAINTAINER=	daniel.sidobre@laas.fr
#HOMEPAGE=	softs.laas.fr:/ftp/pub/openrobots/
COMMENT=	geometry for 6R arms
LICENSE=	isc

CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-tk=$(dir ${TK_CONFIG_SH})

pre-configure: autoreconf

include ../../devel/mkdep/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/sysdep/swig.mk
include ../../pkgtools/libtool/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/robotpkg.mk
