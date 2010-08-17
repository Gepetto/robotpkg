# robotpkg Makefile for:	manipulation/genManip-genom
# Created:			Xavier Broquere on Tue, 20 Apr 2010
#


DISTNAME=		genManip-genom-0.2
CATEGORIES=		manipulation

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=genManip-genom/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/genManip-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Common manipulation-related structures for GenoM modules

GNU_CONFIGURE=		yes

GENOM_MODULE=		genManip
GENOM_ARGS=		-a

include ../../architecture/genom/depend.mk

include ../../architecture/genBasic-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../pkgtools/pkg-config/depend.mk

include ../../mk/robotpkg.mk
