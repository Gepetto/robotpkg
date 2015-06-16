# robotpkg Makefile for:	architecture/genom3
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

VERSION=	2.99.25
DISTNAME=	genom-${VERSION}
PKGNAME=	genom3-${VERSION}
CATEGORIES=	architecture
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genom/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genom3

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	http://www.openrobots.org/wiki/genom3
COMMENT=	Software components generator for robotics architecture.

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
CONFIGURE_ARGS+=--with-eltclsh=${PREFIX.eltclsh}
NOT_FOR_PLATFORM=	# empty

DEPEND_ABI.tcl=	tcl>=8.5

include ../../pkgtools/pkg-config/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
