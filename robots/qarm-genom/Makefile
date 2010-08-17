# robotpkg Makefile for:	robots/qarm-genom
# Created:			Xavier Broquere on Thu, 19 Mar 2009
#

DISTNAME=	qarm-genom-1.1
CATEGORIES=	robots
MASTER_SITES=	${MASTER_SITE_OPENROBOTS}

MAINTAINER=	daniel@laas.fr
#HOMEPAGE=	softs.laas.fr:/ftp/pub/openrobots/
COMMENT=	Control PA10-6C Mitsubishi arm in C-space

GNU_CONFIGURE=	yes

GENOM_MODULE=	qarm
include ../../architecture/genom/depend.mk

include ../../hardware/pa10-libs/depend.mk
include ../../math/gbM/depend.mk
include ../../pkgtools/pkg-config/depend.mk

include ../../mk/robotpkg.mk
