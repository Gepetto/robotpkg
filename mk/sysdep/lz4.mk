# robotpkg sysdep/lz4.mk
# Created:			Anthony Mallet on Wed Aug 13 2014

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LZ4_DEPEND_MK:=		${LZ4_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lz4
endif

ifeq (+,$(LZ4_DEPEND_MK)) # ------------------------------------------------

PREFER.lz4?=		system
DEPEND_USE+=		lz4
DEPEND_ABI.lz4?=	lz4

SYSTEM_SEARCH.lz4=\
	include/lz4.h			\
	'lib/liblz4.{so,a}'

SYSTEM_PKG.Fedora.lz4=	lz4-devel
SYSTEM_PKG.Debian.lz4=	liblz4-dev
SYSTEM_PKG.NetBSD.lz4=	pkgsrc/archivers/lz4

endif # LZ4_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
