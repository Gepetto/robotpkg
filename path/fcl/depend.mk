# robotpkg depend.mk for:	path/fcl
# Created:			Guilhem Saurel on Tue, 17 Oct 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FCL_DEPEND_MK:=		${FCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fcl
endif

ifeq (+,$(FCL_DEPEND_MK)) # ------------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.fcl?=		robotpkg
endif
PREFER.fcl?=		system

DEPEND_USE+=		fcl

DEPEND_ABI.fcl?=	fcl>=0.5
DEPEND_DIR.fcl?=	../../path/fcl

SYSTEM_PKG.Arch.fcl=	fcl (AUR)
SYSTEM_PKG.Debian.fcl=	libfcl-dev
SYSTEM_PKG.Fedora.fcl=	fcl-devel

SYSTEM_SEARCH.fcl=\
  'include/fcl/fcl.h'				\
  'lib/libfcl.so'				\
  'lib/pkgconfig/fcl.pc:/Version/s/[^0-9.]//gp'

endif # FCL_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
