# robotpkg Makefile for:	supervision/transgen
# Created:			Matthieu Herrb on Thu, 12 Mar 2009
#
DISTNAME=	transgen-1.1b0
CATEGORIES=	supervision
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=transgen/}

MAINTAINER=		felix@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/wiki/transgen
LICENSE=		2-clause-bsd
COMMENT=		Glue between Genom modules and OpenPRS.

GNU_CONFIGURE=	yes

DEPEND_ABI.openprs=	openprs>=1.1b1

include ../../supervision/openprs/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../net/libtclserv_client/depend.mk
include ../../mk/language/java.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/perl.mk
include ../../mk/robotpkg.mk
