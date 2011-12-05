# robotpkg sysdep/mercurial.mk
# Created:			Anthony Mallet on Mon,  5 Dec 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MERCURIAL_DEPEND_MK:=	${MERCURIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mercurial
endif

ifeq (+,$(MERCURIAL_DEPEND_MK)) # ------------------------------------------

PREFER.mercurial?=	system
DEPEND_USE+=		mercurial
DEPEND_ABI.mercurial?=	mercurial>=1

SYSTEM_SEARCH.mercurial=\
	'bin/hg:1s/[^0-9.]//gp:% --version'

SYSTEM_PKG.Linux.mercurial=	mercurial
SYSTEM_PKG.NetBSD.mercurial=	devel/mercurial

export HG=		$(word 1,${SYSTEM_FILES.mercurial})

endif # MERCURIAL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
