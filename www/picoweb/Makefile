# robotpkg Makefile for:	www/picoweb
# Created:			Anthony Mallet on Wed, 11 Jul 2007
#

DISTNAME=		picoweb-1.1
PKGREVISION=		1
CATEGORIES=		www
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/picoweb

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://softs.laas.fr/openrobots/
COMMENT=		Dedicated HTTP server for GenoM modules.
LICENSE=		2-clause-bsd
MAKE_JOBS_SAFE=	no

GNU_CONFIGURE=		yes
DEPENDS+=		mkdep>=2.6:../../devel/mkdep

include ../../devel/pocolibs/depend.mk
include ../../mk/robotpkg.mk
