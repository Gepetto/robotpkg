# $NetBSD$
#

DISTNAME=		omniORB-4.1.0
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		OmniORB is an ORB that implements the 2.6 specification of the CORBA

MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		YES

OMNIORB_ETCDIR?= 	${PKG_SYSCONFDIR}
OMNIORB_CONFIG=		${OMNIORB_ETCDIR}/omniORB.cfg

CONFIGURE_ARGS+= 	--with-omniORB-config=${OMNIORB_CONFIG}
CONFIGURE_ARGS+= 	--with-omniNames-logdir=/tmp
CONFIGURE_ARGS+= 	--disable-ipv6

#.include "options.mk"

#PY_PATCHPLIST=	yes

include ../../mk/robotpkg.mk

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/omniORB/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/omniORB/omniORB
	${INSTALL_DATA} ${WRKSRC}/sample.cfg ${PREFIX}/share/examples/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/*.pdf ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/*.ps ${PREFIX}/share/doc/omniORB/
	${INSTALL_DATA} ${WRKSRC}/doc/omniORB/* ${PREFIX}/share/doc/omniORB/omniORB/
	${INSTALL_MAN} ${WRKSRC}/man/man1/* ${PREFIX}/${PKGMANDIR}/man1/
