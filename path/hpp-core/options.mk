#	$Id: options.mk 2008/02/18 15:17:00 mallet $

PKG_OPTIONS_VAR=	PKG_OPTIONS.hpp-core
PKG_SUPPORTED_OPTIONS=	with-body
PKG_SUGGESTED_OPTIONS=	

PKG_OPTION.with-body=	Use internal definition of ChppBody class.

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring jrl-dynamics,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--enable-body
else
CONFIGURE_ARGS+=	--disable-body
DEPENDS+=		hpp-model>=1.0:../../devel/hpp-model
endif
