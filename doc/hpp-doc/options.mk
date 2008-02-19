#	$Id: options.mk 2008/02/19 16:21:35 mallet $

PKG_OPTIONS_VAR=	PKG_OPTIONS.hpp-doc
PKG_SUPPORTED_OPTIONS=
PKG_SUPPORTED_OPTIONS+=	hpp-core

PKG_SUGGESTED_OPTIONS=

PKG_OPTION.autolink=	Find available hpp packages automatically
PKG_OPTION.hpp-core=	Install hpp-core package if needed

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring hpp-core,$(PKG_OPTIONS)))
DEPEND+=		hpp-core>=1.0:../../path/hpp-core
endif
