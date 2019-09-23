# robotpkg Makefile for:	middleware/omniORB
# Created:			Anthony Mallet on Wed, 10 Jan 2007
#

PKGREVISION=		1
DISTNAME=		omniORB-4.2.3
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=omniorb/}
EXTRACT_SUFX?=		.tar.bz2

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://omniorb.sourceforge.net/
COMMENT=		ORB that implements the 2.6 specification of the CORBA
LICENSE=		gnu-lgpl-v2.1


MAKE_FILE=		GNUmakefile
GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniCOS4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniCOSDynamic4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniConnectionMgmt4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniDynamic4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omniORB4.pc.in
PKGCONFIG_OVERRIDE+=	contrib/pkgconfig/omnithread3.pc.in

OMNIORB_ETCDIR?=	${PKG_SYSCONFDIR}
OMNIORB_CONFIG=		${OMNIORB_ETCDIR}/omniORB.cfg

CONFIGURE_ARGS+=	--with-omniORB-config=${OMNIORB_CONFIG}
CONFIGURE_ARGS+=	--with-omniNames-logdir=/tmp
CONFIGURE_ARGS+=	am_cv_python_pythondir=${PREFIX}/lib/omniidl
CONFIGURE_ARGS+=	am_cv_python_pyexecdir=${PREFIX}/lib/omniidl
CONFIGURE_ARGS+=	PYTHON=${PYTHON}

INSTALLATION_DIRS=\
	share/examples/omniORB/		\
	share/doc/omniORB/omniORB

# options
PKG_SUPPORTED_OPTIONS+=	ipv6

PKG_OPTION_DESCR.ipv6=	Enable support for IPv6
PKG_OPTION_SET.ipv6:=	CONFIGURE_ARGS+=--enable-ipv6
PKG_OPTION_UNSET.ipv6:=	CONFIGURE_ARGS+=--disable-ipv6

# INSTALL script installing default configuration file
INSTALL_VARS+=	ECHO CHMOD CP CMP MKDIR RM RMDIR TEST
INSTALL_VARS+=	OMNIORB_ETCDIR OMNIORB_CONFIG
INSTALL_SRC+=	${FILESDIR}/config
DEINSTALL_SRC+=	${FILESDIR}/config

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-install: omni-install-doc

.PHONY: omni-install-doc
omni-install-doc:
	${RUN}								\
	${INSTALL_DATA}							\
	  ${WRKSRC}/sample.cfg ${PREFIX}/share/examples/omniORB/;	\
	${INSTALL_DATA}							\
	  ${WRKSRC}/doc/*.html ${PREFIX}/share/doc/omniORB/;		\
	${INSTALL_DATA}							\
	  ${WRKSRC}/doc/*.pdf ${PREFIX}/share/doc/omniORB/;		\
	${INSTALL_DATA}							\
	  ${WRKSRC}/doc/omniORB/* ${PREFIX}/share/doc/omniORB/omniORB/;	\
	${MKDIR} ${PREFIX}/${PKGMANDIR}/man1/
	${INSTALL_MAN}							\
	  ${WRKSRC}/man/man1/* ${PREFIX}/${PKGMANDIR}/man1/
