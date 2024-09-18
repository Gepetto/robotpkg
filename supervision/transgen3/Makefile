# robotpkg Makefile for:	supervision/transgen3
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

PKGREVISION=	1
DISTNAME=	transgen3-1.0b5
CATEGORIES=	supervision
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=transgen/}
MASTER_REPOSITORY= ${MASTER_REPOSITORY_OPENROBOTS}transgen3

MAINTAINER=		felix@laas.fr
HOMEPAGE=		http://www.openrobots.org/wiki/transgen
LICENSE=		2-clause-bsd
COMMENT=		Glue between Genom modules and OpenPRS.

GNU_CONFIGURE=	yes

DEPEND_ABI.openprs=	openprs>=1.1b8


include ../../architecture/genom3/depend.mk
include ../../supervision/openprs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/bison.mk
include ../../mk/sysdep/flex.mk
include ../../mk/sysdep/perl.mk
include ../../mk/language/java.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
