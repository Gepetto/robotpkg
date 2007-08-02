# $Id: Makefile 2007/06/12 17:29:59 mallet $
#

PKGNAME=		jrl-modelloader-1.1
PKGREVISION=		1
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_JRL}

DISTNAME=		jrl-modelloader-1.1r1
WRKSRC=			${WRKDIR}/jrl-modelloader-1.1

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
