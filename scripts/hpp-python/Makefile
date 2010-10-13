# robotpkg Makefile for:	scripts/hpppython
# Created:			florent on Wed, 10 Oct 2007
#

DISTNAME=	hpppython-${VERSION}
PKGNAME=	hpppython-${VERSION}
VERSION=	1.1

CATEGORIES=	scripts
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Python scripts creating CORBA client of hppCorbaServer
LICENSE=	cnrs-hpp-closed-source

GNU_CONFIGURE=	yes

include ../../devel/hpp-corbaserver/depend.mk
include ../../devel/omniORBpy/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/robotpkg.mk
