# robotpkg sysdep/podlators.mk
# Created:			Anthony Mallet on Thu Aug 29 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PODLATORS_DEPEND_MK:=	${PODLATORS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		podlators
endif

ifeq (+,$(PODLATORS_DEPEND_MK)) # ------------------------------------------

PREFER.podlators?=	system
DEPEND_USE+=		podlators
DEPEND_ABI.podlators?=	podlators

SYSTEM_SEARCH.podlators=\
  'bin/pod2man'		\
  'bin/pod2text'

SYSTEM_PKG.Debian.podlators=	perl
SYSTEM_PKG.Fedora.podlators=	podlators
SYSTEM_PKG.NetBSD.podlators=	lang/perl5

export POD2MAN=		$(word 1,${SYSTEM_FILES.podlators})
export POD2TEXT=	$(word 2,${SYSTEM_FILES.podlators})

endif # PODLATORS_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
