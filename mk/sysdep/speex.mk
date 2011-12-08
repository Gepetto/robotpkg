# robotpkg sysdep/speex.mk
# Created:			Séverin Lemaignan on 8 Dec 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPEEX_DEPEND_MK:=	${SPEEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		speex
endif

ifeq (+,$(SPEEX_DEPEND_MK)) # ----------------------------------------------

PREFER.speex?=		system

DEPEND_USE+=		speex

DEPEND_ABI.speex?=	speex>=1.2

SYSTEM_SEARCH.speex=\
	include/speex/speex.h				\
	'lib/libspeex.{so,a}'				\
	'lib/pkgconfig/speex.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.speex=	libspeex-dev
SYSTEM_PKG.Fedora.speex=	speex-devel
SYSTEM_PKG.NetBSD.speex=	audio/speex
SYSTEM_PKG.Ubuntu.speex=	libspeex-dev

endif # SPEEX_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
