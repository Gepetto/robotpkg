#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: options.mk,v 1.1.1.1 2008/02/07 01:48:22 joerg Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.libfetch
PKG_SUPPORTED_OPTIONS=	inet6 openssl
PKG_SUGGESTED_OPTIONS=

PKG_OPTION.ipv6=	Enable support for IPv6
PKG_OPTION.openssl=	Enable support for OpenSSL

# options not supported yet
#include ../../mk/robotpkg.options.mk

ifneq (,$(findstring ipv6,$(PKG_OPTIONS)))
MAKE_ENV+=		FETCH_WITH_INET6=yes
else
MAKE_ENV+=		FETCH_WITH_INET6=no
endif

ifneq (,$(findstring openssl,$(PKG_OPTIONS)))
MAKE_ENV+=		FETCH_WITH_OPENSSL=yes
else
MAKE_ENV+=		FETCH_WITH_OPENSSL=no
endif
