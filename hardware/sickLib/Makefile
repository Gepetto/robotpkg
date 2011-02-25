# robotpkg Makefile for:	hardware/sickLib
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DISTNAME=		sickLib-${VERSION}
VERSION=		1.0.1
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/sick-libs

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Driver and interface for sick interface
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes

DEPENDS+=		mkdep>=2.6:../../devel/mkdep

include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../hardware/serial/depend.mk
include ../../mk/robotpkg.mk
