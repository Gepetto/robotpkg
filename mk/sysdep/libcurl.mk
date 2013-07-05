# robotpkg sysdep/libcurl.mk
# Created:			Anthony Mallet on Fri,  5 Jul 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBCURL_DEPEND_MK:=	${LIBCURL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libcurl
endif

ifeq (+,$(LIBCURL_DEPEND_MK)) # --------------------------------------------

PREFER.libcurl?=	system
DEPEND_USE+=		libcurl
DEPEND_ABI.libcurl?=	libcurl>=7

SYSTEM_SEARCH.libcurl=	\
  'include/curl/curl.h'					\
  'lib/libcurl.{so,a}'					\
  'lib/pkgconfig/libcurl.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libcurl=libcurl-devel
SYSTEM_PKG.Ubuntu.libcurl=libcurl-dev
SYSTEM_PKG.Debian.libcurl=libcurl-dev
SYSTEM_PKG.NetBSD.libcurl=www/curl

endif # LIBCURL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
