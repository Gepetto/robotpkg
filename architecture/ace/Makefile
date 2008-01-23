# $Id$

ACE_VERSION=		5.6
DISTNAME=		ACE-${ACE_VERSION}
PKGNAME=		ace-${ACE_VERSION}
CATEGORIES=		architecture
MASTER_SITES=		http://download.dre.vanderbilt.edu/previous_versions/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.cs.wustl.edu/~schmidt/ACE.html
COMMENT=		The ADAPTATIVE Communication Environment ACE(tm)

WRKSRC=			${WRKDIR}/ACE_wrappers

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		build
CONFIGURE_SCRIPT=	../configure
CONFIGURE_ARGS+=	--disable-ssl	# we don't use it right now
CONFIGURE_ARGS+=	--disable-ace-tests

USE_PKG_CONFIG=		yes
PKGCONFIG_OVERRIDE+=	ace/ACE.pc.in
PKGCONFIG_OVERRIDE+=	ace/FoxReactor/ACE_FoxReactor.pc.in
PKGCONFIG_OVERRIDE+=	ace/QoS/ACE_QoS.pc.in
PKGCONFIG_OVERRIDE+=	ace/SSL/ACE_SSL.pc.in
PKGCONFIG_OVERRIDE+=	ace/FlReactor/ACE_FlReactor.pc.in
PKGCONFIG_OVERRIDE+=	ace/XtReactor/ACE_XtReactor.pc.in
PKGCONFIG_OVERRIDE+=	ace/QtReactor/ACE_QtReactor.pc.in
PKGCONFIG_OVERRIDE+=	protocols/ace/RMCast/ACE_RMCast.pc.in
PKGCONFIG_OVERRIDE+=	protocols/ace/TMCast/ACE_TMCast.pc.in
PKGCONFIG_OVERRIDE+=	protocols/ace/HTBP/ACE_HTBP.pc.in
PKGCONFIG_OVERRIDE+=	Kokyu/Kokyu.pc.in
PKGCONFIG_OVERRIDE+=	ACEXML/parser/parser/ACEXML_Parser.pc.in
PKGCONFIG_OVERRIDE+=	ACEXML/apps/svcconf/ACEXML_XML_Svc_Conf_Parser.pc.in
PKGCONFIG_OVERRIDE+=	ACEXML/common/ACEXML.pc.in

USE_LIBTOOL=		yes

BUILD_DIRS=		build

include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${MKDIR} ${WRKSRC}/build
