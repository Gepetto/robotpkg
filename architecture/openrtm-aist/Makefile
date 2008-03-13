# $Id$

RTM_VERSION=		0.4.1
DISTNAME=		OpenRTM-aist-${RTM_VERSION}-RELEASE
PKGNAME=		openrtm-aist-${RTM_VERSION}
CATEGORIES=		architecture
MASTER_SITES=		http://www.is.aist.go.jp/rt/OpenRTM-aist/download/CXX/0.4.1/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.is.aist.go.jp/rt/OpenRTM-aist/html-en/FrontPage.html
COMMENT=		Open Robot Technology Middleware from AIST.

DEPENDS+=		ace>=5.6:../../architecture/ace

WRKSRC=			${WRKDIR}/${DISTNAME:-RELEASE=}

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-omniorb=${PREFIX.omniORB}

USE_LIBTOOL=		yes

include ../../devel/omniORB/depend.mk
include ../../mk/robotpkg.mk
