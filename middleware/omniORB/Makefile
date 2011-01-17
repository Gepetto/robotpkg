# robotpkg Makefile for:	middleware/omniORB
# Created:			Anthony Mallet on Wed, 10 Jan 2007
#

DISTNAME=		omniORB-4.1.4
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		ORB that implements the 2.6 specification of the CORBA
LICENSE=		gnu-lgpl-v2.1

USE_TOOLS+=		python
USE_LANGUAGES+=		c c++

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniCOS4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniCOSDynamic4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniConnectionMgmt4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniDynamic4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniORB4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omnithread3.pc.in

OMNIORB_ETCDIR?= 	${PKG_SYSCONFDIR}
OMNIORB_CONFIG=		${OMNIORB_ETCDIR}/omniORB.cfg

CONFIGURE_ARGS+= 	--with-omniORB-config=${OMNIORB_CONFIG}
CONFIGURE_ARGS+= 	--with-omniNames-logdir=/tmp

# options
PKG_SUPPORTED_OPTIONS+=	ipv6

PKG_OPTION_DESCR.ipv6=	Enable support for IPv6
PKG_OPTION_SET.ipv6:=	CONFIGURE_ARGS+=--enable-ipv6
PKG_OPTION_UNSET.ipv6:=	CONFIGURE_ARGS+=--disable-ipv6

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python2.mk
include ../../mk/robotpkg.mk

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/omniORB/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/omniORB/omniORB
	${INSTALL_DATA} ${WRKSRC}/sample.cfg ${PREFIX}/share/examples/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/omniORB/* ${PREFIX}/share/doc/omniORB/omniORB/
	${INSTALL_MAN} ${WRKSRC}/man/man1/* ${PREFIX}/${PKGMANDIR}/man1/
