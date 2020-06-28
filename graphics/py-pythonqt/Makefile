# robotpkg Makefile for:	graphics/py38-PythonQt
# Created:			Guilhem Saurel on Wed, 27 May 2020
#

ORG=			mevislab
NAME=			PythonQt
VERSION=		3.2
PKGREVISION=		1

DISTNAME=		${NAME}${VERSION}
PKGNAME=		${PKGTAG.python-}pythonqt-${VERSION}

HOMEPAGE=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${NAME}/}
MASTER_REPOSITORY=	git ${HOMEPAGE}.git
EXTRACT_SUFX=		.zip

# avoid `-a' that does not reliably convert CR+LF - patch files assume no
# conversion.
EXTRACT_OPTS_ZIP=	-o

CATEGORIES=		graphics
COMMENT=		Dynamic Python binding for Qt Applications
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		guilhem.saurel@laas.fr

QMAKE_ARGS+=		CONFIG+=release
QMAKE_ARGS+=		CONFIG+=no_moc_predefs

SUBST_CLASSES+=		py-ver
SUBST_STAGE.py-ver=	pre-configure
SUBST_MESSAGE.py-ver=	fix python version
SUBST_FILES.py-ver=	build/python.prf
SUBST_SED.py-ver=\
  -e 's/PYTHON_VERSION=2.7/PYTHON_VERSION=${PYTHON_VERSION}/'

PYTHON_SELF_CONFLICT=	yes

INSTALLATION_DIRS+= lib
INSTALLATION_DIRS+= include/${NAME}/gui
INSTALLATION_DIRS+= include/${NAME}/extensions/${NAME}_QtAll

do-install:
	${RUN}cd ${WRKSRC};						\
	${INSTALL_LIB} lib/*.so*					\
	  ${DESTDIR}${PREFIX}/lib/;					\
	${INSTALL_DATA} src/*.h						\
	  ${DESTDIR}${PREFIX}/include/${NAME}/;				\
	${INSTALL_DATA} src/gui/*.h					\
	  ${DESTDIR}${PREFIX}/include/${NAME}/gui/;			\
	${INSTALL_DATA} extensions/${NAME}_QtAll/*.h			\
	  ${DESTDIR}${PREFIX}/include/${NAME}/extensions/${NAME}_QtAll/

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt5-multimedia.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-qtbase-private.mk
include ../../mk/sysdep/qt5-svg.mk
include ../../mk/sysdep/qt5-tools.mk
include ../../mk/sysdep/qt5-xmlpatterns.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

# QByteArrayList
DEPEND_ABI.qt5-qtbase+=	qt5-qtbase>=5.4

include ../../mk/robotpkg.mk
