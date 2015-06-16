# robotpkg Makefile for:	net/genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DISTNAME=	genomix-1.5
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=genomix/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genomix

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	http://www.openrobots.org/wiki/genom3
COMMENT=	HTTP server for controlling GenoM3 components

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
NOT_FOR_PLATFORM=	# empty

DEPEND_ABI.tcl=	tcl>=8.5

include ../../pkgtools/pkg-config/depend.mk
include ../../architecture/genom3/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
