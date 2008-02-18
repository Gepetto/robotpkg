#	$Id: options.mk 2008/02/18 14:30:07 mallet $

PKG_OPTIONS_VAR=	PKG_OPTIONS.hpp-model
PKG_SUPPORTED_OPTIONS=	jrl-dynamics
PKG_SUGGESTED_OPTIONS=	jrl-dynamics

PKG_OPTION.jrl-dynamics=Use jrl-dynamics package for dynamic model implementation.

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring jrl-dynamics,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--with-robotDynamics=dynamicsJRLJapan
DEPENDS+=		jrl-dynamics>=1.7:../../math/jrl-dynamics
endif
