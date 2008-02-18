#	$Id: options.mk 2008/02/18 17:22:16 mallet $

PKG_OPTIONS_VAR=	PKG_OPTIONS.hpp-corbaserver
PKG_SUPPORTED_OPTIONS=	openhrp
PKG_SUGGESTED_OPTIONS=	openhrp

PKG_OPTION.openhrp=	Build an OpenHRP(tm) client.

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring openhrp,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--with-openhrp
DEPENDS+=		hpp-openhrp>=1.1:../../path/hpp-openhrp
DEPENDS+=		jrl-modelloader>=1.2:../../devel/jrl-modelloader
DEPENDS+=		hrp2-dynamics>=1.0:../../math/hrp2-dynamics
DEPENDS+=		hrp2_14>=1.0:../../robots/hrp2-14
endif
