# robotpkg sysdep/openssl.mk
# Created:			Anthony Mallet on Fri Nov 20 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENSSL_DEPEND_MK:=	${OPENSSL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openssl
endif

ifeq (+,$(OPENSSL_DEPEND_MK)) # --------------------------------------------

PREFER.openssl?=	system
DEPEND_USE+=		openssl
DEPEND_ABI.openssl?=	openssl>=0.9.6

SYSTEM_PKG.Fedora.openssl=	openssl-devel
SYSTEM_PKG.Ubuntu.openssl=	libssl-dev
SYSTEM_PKG.Debian.openssl=	libssl-dev
SYSTEM_PKG.NetBSD.openssl=	pkgsrc/security/openssl

_vregex.openssl:=s/^.*OpenSSL[ ]*//;s/[ -].*$$//;p
SYSTEM_SEARCH.openssl:=	\
  'bin/openssl:/OpenSSL/{${_vregex.openssl};}:% version'		\
  'include/openssl/opensslv.h:/VERSION_TEXT/{${_vregex.openssl};q;}'	\
  'lib/libcrypto.*'							\
  'lib/libssl.*'

endif # OPENSSL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
