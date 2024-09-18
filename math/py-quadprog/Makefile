# robotpkg Makefile for:	math/py27-quadprog
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

PKGREVISION=		2
ORG=			rmcgibbo
PYPI_PATH=		24/fb/816f87f1b9648231b51012758b1d8fa3043ee1a428e3dbb64c6e6a42b6b9/
VERSION=		0.1.6
DISTNAME=		quadprog-${VERSION}
PKGNAME=		${PKGTAG.python-}quadprog-${VERSION}
MASTER_SITES=		https://files.pythonhosted.org/packages/${PYPI_PATH}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}${ORG}/quadprog.git

CATEGORIES=		math
HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/quadprog}
COMMENT=		Solve a strictly convex quadratic program
LICENSE=		gnu-gpl-v2
MAINTAINER=		gsaurel@laas.fr

MAKE_ENV+=		PYTHONPATH=${PREFIX}/${PYTHON_SITELIB}

include ../../mk/sysdep/py-cython.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-setuptools.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
