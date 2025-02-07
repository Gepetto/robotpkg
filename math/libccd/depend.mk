# robotpkg depend.mk for:	math/libccd
# Created:			Anthony Mallet on Tue, 28 Apr 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBCCD_DEPEND_MK:=	${LIBCCD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libccd
endif

ifeq (+,$(LIBCCD_DEPEND_MK)) # ---------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.libccd?=	robotpkg
endif
PREFER.libccd?=		system

DEPEND_USE+=		libccd

DEPEND_ABI.libccd?=	libccd>=2.0
DEPEND_DIR.libccd?=	../../math/libccd

SYSTEM_SEARCH.libccd=\
  'include/ccd/ccd.h'					\
  'lib/libccd.so'					\
  'lib/pkgconfig/ccd.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.python312=	libccd-devel
SYSTEM_PKG.Debian.python312=	libccd-dev
SYSTEM_PKG.NetBSD.python312=	lang/python312

endif # LIBCCD_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
