# robotpkg Makefile for:	supervision/tcl-genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DISTNAME=	tcl-genomix-1.6.2
CATEGORIES=	supervision
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=tcl-genomix/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}genomix/tcl-genomix

MAINTAINER=	mallet@laas.fr
HOMEPAGE=	https://homepages.laas.fr/mallet/soft/architecture/genom3
COMMENT=	Interactive genomix TCL client for controlling GenoM3 components

LICENSE=	2-clause-bsd

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-tcl=$(dir ${TCL_CONFIG_SH})
NOT_FOR_PLATFORM=	# empty

DEPEND_ABI.tcl=	tcl>=8.5

include ../../mk/sysdep/tcl.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
