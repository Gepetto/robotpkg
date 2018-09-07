# robotpkg sysdep/gpgme.mk
# Created:			Anthony Mallet on Sep  7 2018

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GPGME_DEPEND_MK:=	${GPGME_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gpgme
endif

ifeq (+,$(GPGME_DEPEND_MK)) # ----------------------------------------------

PREFER.gpgme?=		system
DEPEND_USE+=		gpgme
DEPEND_ABI.gpgme?=	gpgme>=1

SYSTEM_SEARCH.gpgme=\
  'bin/gpgme-tool:1s/[^0-9.]//gp:% --version'			\
  'include/gpgme.h:/GPGME_VERSION/s/[^0-9.]//gp'	\
  'lib/libgpgme.so'

SYSTEM_PKG.Redhat.gpgme=	systemd-devel
SYSTEM_PKG.Debian.gpgme=	libgpgme11-dev
SYSTEM_PKG.NetBSD.gpgme=	security/gpgme

endif # GPGME_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
