# robotpkg Makefile for:	scripts/hpppython
# Created:			florent on Wed, 10 Oct 2007
#

DISTNAME=	hpp-python-${VERSION}
PKGNAME=	hpp-python-${VERSION}
VERSION=	1.2.1
PKGREVISION=	1

CATEGORIES=	scripts
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=hpp-python/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_JRL}corba/hpp-python

MAINTAINER=	hpp@laas.fr
#HOMEPAGE=
COMMENT=	Python scripts creating CORBA client of hppCorbaServer
LICENSE=	cnrs-hpp-closed-source

DOXYGEN_PLIST_DIR+=	share/doc/hpp-python

GNU_CONFIGURE=	yes

include ../../devel/hpp-corbaserver/depend.mk
include ../../middleware/omniORBpy/depend.mk
include ../../mk/sysdep/python.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

post-install: python-compile-all(${PREFIX}/${PYTHON_SITELIB}/hpp) \
python-compile-all(${PREFIX}/${PYTHON_SITELIB}/hpp_corbaserver)
