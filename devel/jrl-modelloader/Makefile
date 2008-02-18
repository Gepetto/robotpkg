# $Id: Makefile 2008/02/18 15:02:16 mallet $
#

DISTNAME=		jrl-modelloader-1.2
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_JRL}

RESTRICTED=		You cannot redistribute this software.
NO_PUBLIC_SRC=		${RESTRICTED}
NO_PUBLIC_BIN=		${RESTRICTED}

MAINTAINER=		hpp@laas.fr
COMMENT=		CORBA server for VRML model loader.
DEPENDS+=		openhrp-jrl>=20060713r5:../../architecture/openhrp-jrl

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-openhrp=${PREFIX}/OpenHRP

NO_BUILD=		yes

include ../../mk/robotpkg.mk
