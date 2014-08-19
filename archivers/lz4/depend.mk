# robotpkg depend.mk for:	archivers/lz4
# Created:			Anthony Mallet on Mon, 18 Aug 2014
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LZ4_DEPEND_MK:=		${LZ4_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		lz4
endif

ifeq (+,$(LZ4_DEPEND_MK)) # ------------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04,${OS_VERSION}))
    PREFER.lz4?=	robotpkg
  endif
else ifeq (OpenNao,${OPSYS})
  PREFER.lz4?=		robotpkg
endif
PREFER.lz4?=		system
DEPEND_USE+=		lz4
DEPEND_ABI.lz4?=	lz4
DEPEND_DIR.lz4?=	../../archivers/lz4

SYSTEM_SEARCH.lz4=\
	include/lz4.h			\
	'lib/liblz4.{so,a}'

SYSTEM_PKG.Fedora.lz4=	lz4-devel
SYSTEM_PKG.Debian.lz4=	liblz4-dev
SYSTEM_PKG.NetBSD.lz4=	pkgsrc/archivers/lz4

endif # LZ4_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
