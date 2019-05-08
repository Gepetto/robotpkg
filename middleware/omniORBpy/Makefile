# robotpkg Makefile for:	middleware/omniORBpy
# Created:			Anthony Mallet on Tue, 6 Mar 2007
#

DISTNAME=		omniORBpy-4.2.3
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}
EXTRACT_SUFX?=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		Robust high-performance CORBA ORB for Python
LICENSE=		gnu-lgpl-v2.1

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}
CONFIGURE_ARGS+=	am_cv_python_pythondir=${PREFIX}/${PYTHON_SITELIB}
CONFIGURE_ARGS+=	am_cv_python_pyexecdir=${PREFIX}/${PYTHON_SITELIB}
CONFIGURE_ARGS+=	PYTHON=${PYTHON}

# [ Tue Feb 28 17:44:28 NZDT 2012 : sbd ]
# The omniORB and omniORBpy packages install files into
# ${PYSITELIB}/omniidl_be, but the only files that conflicts are __init__.py
# with the comment and __init__.pyc. DYNAMIC_PLIST_DIRS alows to handle this
# smoothly.
DYNAMIC_PLIST_DIRS+=	${PYTHON_SITELIB}/omniidl_be

# Need to be in sync with middleware/omniORB
PREFER.omniORB?=	robotpkg
DEPEND_ABI.omniORB+=	omniORB>=4.2<4.3

include ../../middleware/omniORB/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
