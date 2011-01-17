# robotpkg Makefile for:	middleware/omniORBpy
# Created:			Anthony Mallet on Tue, 6 Mar 2007
#

DISTNAME=		omniORBpy-3.1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		Robust high-performance CORBA ORB for Python
LICENSE=		gnu-lgpl-v2.1

USE_LANGUAGES+=		c c++
USE_TOOLS+=		python

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}

include ../../middleware/omniORB/depend.mk
include ../../mk/robotpkg.mk
