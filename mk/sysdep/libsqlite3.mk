# robotpkg sysdep/libsqlite3.mk
# Created:			Anthony Mallet on Mon Aug  5 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSQLITE3_DEPEND_MK:=	${LIBSQLITE3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libsqlite3
endif

ifeq (+,$(LIBSQLITE3_DEPEND_MK)) # -----------------------------------------

PREFER.libsqlite3?=	system

DEPEND_USE+=		libsqlite3
DEPEND_ABI.libsqlite3?=	libsqlite3>=3

SYSTEM_SEARCH.libsqlite3=\
  'include/sqlite3.h'					\
  'lib/libsqlite3.{so,a}'				\
  'lib/pkgconfig/sqlite3.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libsqlite3=	libsqlite3-dev
SYSTEM_PKG.Fedora.libsqlite3=	libsqlite3x-devel
SYSTEM_PKG.Ubuntu.libsqlite3=	libsqlite3-dev
SYSTEM_PKG.NetBSD.libsqlite3=	databases/sqlite3

endif # LIBSQLITE3_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
