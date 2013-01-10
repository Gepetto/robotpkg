# robotpkg Makefile for:	image/niut-genom
# Created:			Matthieu Herrb on Tue, 11 Jan 2011
#

DISTNAME=	niut-genom-0.4
PKGREVISION= 1
CATEGORIES=	image

MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=niut-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/niut-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	GenoM module for the NITE user tracker from PrimeSense
LICENSE=	isc

GENOM_MODULE=	niut



PKG_SUPPORTED_OPTIONS+=	filter
PKG_OPTION_DESCR.filter=	Compile niut with the sensFusion-libs
define PKG_OPTION_SET.filter
  GENOM_ARGS+= -DLP_FILTER
  include ../../math/sensFusion-libs/depend.mk
endef


include ../../image/openni-nite/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
