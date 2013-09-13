# robotpkg sysdep/gts.mk
# Created:			Severin Lemaignan on Wed 1 Sep 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTS_DEPEND_MK:=		${GTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gts
endif

ifeq (+,$(GTS_DEPEND_MK)) # ------------------------------------------------

PREFER.gts?=		system
DEPEND_USE+=		gts
DEPEND_ABI.gts?=	gts>=0.7

SYSTEM_SEARCH.gts=\
  'bin/gts-config:p:% --version'		\
  'include/gts.h'				\
  'lib/libgts.so'				\
  'lib/pkgconfig/gts.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.gts=libgts-dev
SYSTEM_PKG.Fedora.gts=gts-devel
SYSTEM_PKG.NetBSD.gts=wip/gts

endif # GTS_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
