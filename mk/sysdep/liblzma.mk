# robotpkg sysdep/liblzma.mk
# Created:			Arnaud Degroote on Mar 29 2013

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBLZMA_DEPEND_MK:=	${LIBLZMA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		liblzma
endif

ifeq (+,$(LIBLZMA_DEPEND_MK)) # --------------------------------------------

PREFER.liblzma?=	system
DEPEND_USE+=		liblzma
DEPEND_ABI.liblzma?=	liblzma>=5.0

SYSTEM_SEARCH.liblzma=	\
	'include/lzma.h'	           \
	'lib/liblzma.so'			  \
	'lib/pkgconfig/liblzma.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Fedora.liblzma=	liblzma-devel
SYSTEM_PKG.Ubuntu.liblzma=	liblzma-dev
SYSTEM_PKG.Debian.liblzma=	liblzma-dev
SYSTEM_PKG.NetBSD.liblzma=	archivers/xz

endif # LIBLZMA_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
