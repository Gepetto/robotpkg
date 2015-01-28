# robotpkg sysdep/libelf.mk
# Created:			Anthony Mallet on Jan 28 2015

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBELF_DEPEND_MK:=	${LIBELF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libelf
endif

ifeq (+,$(LIBELF_DEPEND_MK)) # ---------------------------------------------

PREFER.libelf?=		system
DEPEND_USE+=		libelf
DEPEND_ABI.libelf?=	libelf

SYSTEM_SEARCH.libelf=\
  'include{,/libelf}/libelf.h'			\
  'lib/libelf.{so,a}'

SYSTEM_PKG.Fedora.libelf=	elfutils-libelf-devel
SYSTEM_PKG.Debian.libelf=	libelf-dev
SYSTEM_PKG.NetBSD.libelf=	devel/libelf

endif # LIBELF_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
