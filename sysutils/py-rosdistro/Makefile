# robotpkg Makefile for:	sysutils/py-rosdistro
# Created:			Anthony Mallet on Tue, 25 Jun 2013
#

DISTNAME=	rosdistro-0.8.3
PKGNAME=	${PKGTAG.python-}${DISTNAME}
MASTER_SITES=	${MASTER_SITE_GITHUB:=ros-infrastructure/}

COMMENT=	Tool for managing ROS distributions and packages
CATEGORIES=	sysutils
MAINTAINER=	mallet@laas.fr
LICENSE=	modified-bsd

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/rosdistro*

include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
