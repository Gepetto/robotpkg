# robotpkg sysdep/lua.mk
# Created:			Anthony Mallet on Wed Aug 21 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LUA_DEPEND_MK:=		${LUA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lua
endif

ifeq (+,$(LUA_DEPEND_MK)) # ------------------------------------------------

PREFER.lua?=		system
DEPEND_USE+=		lua
DEPEND_ABI.lua?=	lua>=5

SYSTEM_SEARCH.lua=\
  'bin/lua:1{s/^[^0-9.]*//;s/[^0-9.].*//;p;}:% -v'	\
  'lib/liblua{,[0-9]*}.so'				\
  'lib/pkgconfig/lua{,[0-9]*}.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.lua=	lua liblua-dev
SYSTEM_PKG.Fedora.lua=	lua
SYSTEM_PKG.NetBSD.lua=	lang/lua

export LUA=		$(word 1,${SYSTEM_FILES.lua})

endif # LUA_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
