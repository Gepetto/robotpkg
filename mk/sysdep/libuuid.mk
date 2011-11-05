# robotpkg sysdep/libuuid.mk
# Created:			Anthony Mallet on Sat  5 Nov 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBUUID_DEPEND_MK:=	${LIBUUID_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libuuid
endif

ifeq (+,$(LIBUUID_DEPEND_MK)) # --------------------------------------------

PREFER.libuuid?=	system
DEPEND_USE+=		libuuid
DEPEND_ABI.libuuid?=	libuuid>=1

SYSTEM_SEARCH.libuuid=	\
	include/uuid/uuid.h	\
	lib/libuuid.so		\
	'lib/pkgconfig/uuid.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libuuid=uuid-dev
SYSTEM_PKG.Fedora.libuuid=libuuid-devel
SYSTEM_PKG.NetBSD.libuuid=devel/libuuid
SYSTEM_PKG.Ubuntu.libuuid=uuid-dev

endif # LIBUUID_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
