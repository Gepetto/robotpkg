# $Id:$
#

DISTNAME=		viam-genom-0.99
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.laas.fr/~mallet
COMMENT=		Versatile Image Acquisition Module - GenoM component

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_PKG_CONFIG=		yes

GENOM_MODULE=		viam
include ../../architecture/genom/depend.mk

include ../../image/viam-libs/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../mk/robotpkg.mk

# waiting for a more modular solution, hardcode -t
# -o will require transgen
#pre-configure:
#	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PREFIX}/bin/genom -t viam
