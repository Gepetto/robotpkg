# robotpkg sysdep/liblua.mk
# Created:			Anthony Mallet on Mon Mar 24 2014
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBLUA_DEPEND_MK:=	${LIBLUA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		liblua
endif

ifeq (+,$(LIBLUA_DEPEND_MK)) # ---------------------------------------------

PREFER.liblua?=		system
DEPEND_USE+=		liblua
DEPEND_ABI.liblua?=	liblua>=5

SYSTEM_SEARCH.liblua=\
  'include/{,lua[0-9]*/}lua.h'					\
  'lib/liblua{[0-9]*,}.so'					\
  'lib/pkgconfig/lua{[0-9]*,}.pc:/Version/s/[^0-9]//gp'

SYSTEM_PKG.Debian.liblua=	liblua5.2-dev
SYSTEM_PKG.Fedora.liblua=	lua-devel
SYSTEM_PKG.Gentoo.liblua=	dev-lang/lua
SYSTEM_PKG.NetBSD.liblua=	lang/lua

export LIBLUA=		$(word 1,${SYSTEM_FILES.liblua})

endif # LIBLUA_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
