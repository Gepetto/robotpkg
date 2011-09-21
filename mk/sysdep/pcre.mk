# robotpkg sysdep/pcre.mk
# Created:			Anthony Mallet on Tue, 21 Sep 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PCRE_DEPEND_MK:=	${PCRE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pcre
endif

ifeq (+,$(PCRE_DEPEND_MK)) # -----------------------------------------------

PREFER.pcre?=		system

DEPEND_USE+=		pcre

DEPEND_ABI.pcre?=	pcre>=7

SYSTEM_SEARCH.pcre=\
	'bin/pcre-config::% --version'					\
	'include/pcre.h'						\
	'include/pcrecpp.h'						\
	'lib/libpcre.{so,a}'						\
	'lib/libpcrecpp.{so,a}'						\
	'lib/pkgconfig/libpcre.pc:/Version/s/[^0-9.]//gp'		\
	'lib/pkgconfig/libpcrecpp.pc:/Version/s/[^0-9.]//gp'		\

SYSTEM_PKG.Fedora.pcre=	libpcre-devel
SYSTEM_PKG.Ubuntu.pcre=	libpcre3-dev
SYSTEM_PKG.NetBSD.pcre=	pkgsrc/devel/pcre

endif # PCRE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
