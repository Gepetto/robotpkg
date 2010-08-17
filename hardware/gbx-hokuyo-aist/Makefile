# robotpkg Makefile for:	hardware/gbx-hokuyo-aist
# Created:			Anthony Mallet on Wed, 17 Mar 2010
#
GBX_PACKAGE=	hokuyo-aist-1.0.0
GBX_COMMENT=	Hokuyo AIST driver

CATEGORIES=	hardware
include ../../meta-pkgs/gearbox/Makefile.common

CMAKE_ARGS+=	-DENABLE_LIB_HOKUYO_AIST=ON

include ../../devel/gbx-share/depend.mk
include ../../devel/gbx-flexiport/depend.mk
include ../../mk/robotpkg.mk
