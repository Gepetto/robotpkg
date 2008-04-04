# $Id: Makefile 2008/04/04 14:18:04 mallet $

DISTNAME=	dynamicsjrljapan-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.8

CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_JRL}
NO_PUBLIC_SRC=	yes

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	
COMMENT=	JRL-Japan implementation of dynamic robot.

DEPENDS+=	jrl-mal>=1.4:../../interfaces/jrl-mal

GNU_CONFIGURE=	yes
USE_PKG_CONFIG=	yes
USE_LIBTOOL=	yes

include ../../interfaces/jrl-interface-dynamics/depend.mk
include ../../mk/robotpkg.mk
