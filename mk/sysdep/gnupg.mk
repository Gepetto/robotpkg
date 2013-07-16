# robotpkg sysdep/gnupg.mk
# Created:			Anthony Mallet on Mon, 15 Jul 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GNUPG_DEPEND_MK:=	${GNUPG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gnupg
endif

ifeq (+,$(GNUPG_DEPEND_MK)) # ----------------------------------------------

PREFER.gnupg?=		system

DEPEND_USE+=		gnupg
DEPEND_ABI.gnupg?=	gnupg>=1

SYSTEM_SEARCH.gnupg=	\
  'bin/gpg:1s/[^0-9.]//gp:% --version'

SYSTEM_PKG.Linux.gnupg=	gnupg
SYSTEM_PKG.NetBSD.gnupg=security/gnupg

GPG_HOMEDIR?=		${PKG_SYSCONFDIR}/gnupg
export GPG=		${PREFIX.gnupg}/bin/gpg --homedir=${GPG_HOMEDIR}

endif # GNUPG_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
