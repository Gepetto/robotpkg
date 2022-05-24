# robotpkg Makefile for:	image/viman-genom
# Created:			Séverin Lemaignan on Tue, 31 Aug 2010
#

DISTNAME=		viman-genom-1.6
CATEGORIES=		image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=viman-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS_TRAC}viman-genom

MAINTAINER=		openrobots@laas.fr
COMMENT=		Pattern-based marker detection and localization

# Viman license is GPL because it links with ARToolKit which is GPL.
LICENSE=		gnu-gpl-v2


GENOM_MODULE=		viman
INCLUDE_DIRS.libjpeg+=	include
LIBRARY_DIRS.libjpeg+=	lib
RPATHS_DIRS.libjpeg+=	lib

# because of the libjpeg flags, a system opencv may be found in the compiler
# paths before the robotpkg one. Make sure to prepend prefix paths here so that
# any robotpkg version is found first.
CPPFLAGS+=             -I${PREFIX}/include
LIBRARY_DIRS+=         lib
RPATH_DIRS+=           lib

include ../../architecture/genom/depend.mk
include ../../image/viam-genom/depend.mk
include ../../image/viam-libs/depend.mk
include ../../image/artoolkitplus/depend.mk
include ../../image/opencv/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../localization/pom-genom/depend.mk
include ../../math/gbM/depend.mk
include ../../math/t3d/depend.mk
include ../../manipulation/genManip-genom/depend.mk
include ../../mk/sysdep/libjpeg.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

DEPEND_ABI.opencv += opencv<3

include ../../mk/robotpkg.mk
