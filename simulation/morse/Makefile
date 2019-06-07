# robotpkg Makefile for:	simulation/morse
# Created:			Severin Lemaignan on Tue, 12 Apr 2011
#

PKGREVISION=		1
PKGNAME=		morse-${MORSE_VERSION}

include ../../simulation/morse/Makefile.common

CMAKE_ARGS+=		-DBUILD_CORE_SUPPORT=ON

CMAKE_ARGS+=		-DBUILD_POCOLIBS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_ROS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_YARP_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_MOOS_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_HLA_SUPPORT=OFF
CMAKE_ARGS+=		-DBUILD_MAVLINK_SUPPORT=OFF
CMAKE_ARGS+= 		-DPYMORSE_SUPPORT=OFF

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  CMAKE_ARGS+=		-DBUILD_DOC_SUPPORT=ON
  CMAKE_ARGS+=		-DSPHINX_BUILD=${SPHINX_BUILD}
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}/html
  include ../../mk/sysdep/py-sphinx.mk
endef
define PKG_OPTION_UNSET.doc
  CMAKE_ARGS+=		-DBUILD_DOC_SUPPORT=OFF
endef

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
