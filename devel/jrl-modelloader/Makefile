# $Id: Makefile 2007/11/22 14:51:12 mallet $
#

PKGNAME=		jrl-modelloader-1.2
PKGREVISION=		0
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_JRL}

DISTNAME=		jrl-modelloader-1.2
WRKSRC=			${WRKDIR}/jrl-modelloader-1.2

RESTRICTED=		You cannot redistribute this software.
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

MAINTAINER=		gepetto@laas.fr
COMMENT=		CORBA server for VRML model loader.
DEPENDS+=		openhrp-jrl>=20060713r5:../../architecture/openhrp-jrl

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

NO_BUILD=		yes

include ../../mk/robotpkg.mk
