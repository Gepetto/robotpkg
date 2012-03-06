# robotpkg Makefile for:	simulation/morse
# Created:			Severin Lemaignan on Tue, 12 Apr 2011
#

PKGNAME=		morse-${MORSE_VERSION}

include ../../simulation/morse/Makefile.common

CMAKE_ARGS+=		-DBUILD_CORE_SUPPORT=ON

CMAKE_ARGS+=		-DBUILD_POCOLIBS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_ROS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_YARP2_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_MOOS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_HLA_SUPPORT=OFF

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  CMAKE_ARGS+=		-DBUILD_DOC_SUPPORT=ON
  CMAKE_ARGS+=		-DSPHINX_BUILD=${PREFIX.py-sphinx}/bin/sphinx-build
  include ../../mk/sysdep/py-sphinx.mk
endef
define PKG_OPTION_UNSET.doc
  CMAKE_ARGS+=		-DBUILD_DOC_SUPPORT=OFF
endef

include ../../mk/robotpkg.mk
