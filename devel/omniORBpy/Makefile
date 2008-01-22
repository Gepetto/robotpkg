# $NetBSD$
#

DISTNAME=		omniORBpy-3.1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		Robust high-performance CORBA ORB for Python

USE_TOOLS+=		python

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes

DEPENDS+=		omniORB>=4.1.1:../../devel/omniORB

include ../../mk/robotpkg.mk
