# robotpkg sysdep/libpcap.mk
# Created:			Matthieu Herrb on Thu  5 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPCAP_DEPEND_MK:=	${LIBPCAP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libcap
endif

ifeq (+,$(LIBPCAP_DEPEND_MK)) # ---------------------------------------------

PREFER.libpcap?=	system

DEPEND_USE+=		libpcap

DEPEND_ABI.libpcap?=	libpcap>=1

SYSTEM_SEARCH.libpcap=	\
	'include/pcap.h'						\
	'lib/libpcap.{a,so}'

SYSTEM_PKG.Fedora.libpcap=	libpcap-devel
SYSTEM_PKG.Debian.libpcap=	libpcap-dev
SYSTEM_PKG.Gentoo.libpcap=	net-libs/libpcap

endif # LIBPCAP_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
