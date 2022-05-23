# robotpkg language/rpc.mk
# Created:			Anthony Mallet on Fri, 7 Sep 2018
#
ifndef _language_rpc_mk
_language_rpc_mk:=defined

#
# This file determines which RPC library is used.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.rpc
#	The preferred rpc library to use. The order of the entries matters,
#	since earlier entries are preferred over later ones.
#
#	Possible values: libc-rpc libtirpc
#	Default: libc-rpc
#
PKG_ALTERNATIVES+=		rpc
PKG_ALTERNATIVES.rpc=		libc-rpc libtirpc

# set default preferences depending on OS/VERSION
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  ifneq (,$(filter 26 27,${OS_VERSION}))
     PREFER_ALTERNATIVE.rpc?=	libc-rpc
  endif
  PREFER_ALTERNATIVE.rpc?=	libtirpc
else ifeq (Rocky,${OPSYS})
  PREFER_ALTERNATIVE.rpc?=	libtirpc
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 1% 20.04,${OS_VERSION}))
     PREFER_ALTERNATIVE.rpc?=	libc-rpc
  endif
  PREFER_ALTERNATIVE.rpc?=	libtirpc
endif
PREFER_ALTERNATIVE.rpc?=	libc-rpc

PKG_ALTERNATIVE_DESCR.libc-rpc=	Use the C library RPC implementation
PKG_ALTERNATIVE_SELECT.libc-rpc=ok # non-empty
define PKG_ALTERNATIVE_SET.libc-rpc
  include ../../mk/sysdep/libc-rpc.mk
endef

PKG_ALTERNATIVE_DESCR.libtirpc=	Use the libtirpc RPC implementation
PKG_ALTERNATIVE_SELECT.libtirpc=ok # non-empty
define PKG_ALTERNATIVE_SET.libtirpc
  include ../../mk/sysdep/libtirpc.mk
endef

endif # _language_rpc_mk ---------------------------------------------------
