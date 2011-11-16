# robotpkg Makefile for:	image/stereopixel-genom
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DISTNAME=		stereopixel-genom-1.2
PKGREVISION=		1
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}stereopixel-genom

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation - GenoM component
LICENSE=		2-clause-bsd

GENOM_MODULE=		stereopixel
NOT_FOR_PLATFORM=

define PKG_OPTION_UNSET.api
  include ../../image/libstereopixel/depend.mk
  include ../../image/libimages3d/depend.mk
  include ../../image/opencv/depend.mk
endef

include ../../image/viam-genom/depend.mk
include ../../architecture/genom/depend.mk
include ../../mk/robotpkg.mk
