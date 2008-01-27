#	$Id: options.mk de6c97cd51ea60c42e9cc9201526fe77 2008/01/26 16:41:04 tho $

PKG_OPTIONS_VAR=	PKG_OPTIONS.omniORB
PKG_SUPPORTED_OPTIONS=	ipv6
PKG_SUGGESTED_OPTIONS=#empty

PKG_OPTION.ipv6=	Enable support for IPv6

include ../../mk/robotpkg.options.mk

ifneq (,$(findstring ipv6,$(PKG_OPTIONS)))
CONFIGURE_ARGS+=--enable-ipv6
else
CONFIGURE_ARGS+=--disable-ipv6
endif
