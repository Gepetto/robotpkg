# robotpkg sysdep/gtar.mk
# Created:			Anthony Mallet on Sun Nov  6 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GTAR_DEPEND_MK:=	${GTAR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gtar
endif

ifeq (+,$(GTAR_DEPEND_MK)) # -----------------------------------------------

PREFER.gtar?=		system
DEPEND_USE+=		gtar
DEPEND_ABI.gtar?=	gtar>=1
DEPEND_METHOD.gtar?=	build

SYSTEM_SEARCH.gtar=\
  'bin/{,g}tar:/GNU tar/{s/[^.0-9]//gp;q;};$$s/.*/non GNU/p:% --version'

SYSTEM_DESCR.gtar?=	GNU tar
SYSTEM_PKG.Debian.gtar=	tar
SYSTEM_PKG.Fedora.gtar=	tar
SYSTEM_PKG.NetBSD.gtar=	archivers/gtar
SYSTEM_PKG.Ubuntu.gtar=	tar

export GTAR=		$(word 1,${SYSTEM_FILES.gtar})

endif # GTAR_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
