#	$Id: options.mk de6c97cd51ea60c42e9cc9201526fe77 2008/01/26 16:41:04 tho $

PKG_OPTIONS_VAR=	PKG_OPTIONS.jrl-mal
PKG_SUPPORTED_OPTIONS=	boost vnl t3d
PKG_SUGGESTED_OPTIONS=	boost t3d

PKG_OPTION.boost=	Use boost for generic NxP matrix implementation
PKG_OPTION.vnl=		Use vnl for generic NxP matrix implementation
PKG_OPTION.t3d=		Use t3d for rigid body transformations

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring boost,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--with-boost=${PREFIX}
DEPENDS+=	boost-numeric-bindings>=20070129:../../devel/boost-numeric-bindings
DEPENDS+=       lapack>=3.1.0r1:../../math/lapack
endif

ifneq (,$(findstring vnl,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--with-vnl=${PREFIX}
endif

ifneq (,$(findstring t3d,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=	--with-t3d
DEPENDS+=		libt3d>=2.5:../../math/t3d
endif
