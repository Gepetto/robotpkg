# robotpkg Makefile for:	image/libstereopixel
# Created:			Anthony Mallet on Wed, 5 Dec 2007
#

DISTNAME=		libstereopixel-1.5
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=libstereopixel/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}libstereopixel

MAINTAINER=		openrobots@laas.fr
#HOMEPAGE=
COMMENT=		Stereo-vision by pixel correlation
LICENSE=		2-clause-bsd

NOT_FOR_PLATFORM=
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	$(if $(filter MacOSX,${OPSYS}),--disable-threads)

# options
PKG_SUPPORTED_OPTIONS+=	calife sse
PKG_SUPPORTED_OPTIONS+= $(if $(filter-out MacOSX,${OPSYS}),pthread)

PKG_OPTION_DESCR.sse=	 	Enable sse optimization
PKG_OPTION_SET.sse=		CONFIGURE_ARGS+=--enable-sse
PKG_OPTION_UNSET.sse=		CONFIGURE_ARGS+=--disable-sse

PKG_OPTION_DESCR.pthread=	Enable parallelization
PKG_OPTION_SET.pthread=		CONFIGURE_ARGS+=--enable-threads
PKG_OPTION_UNSET.pthread=	CONFIGURE_ARGS+=--disable-threads


include ../../image/libimages3d/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
