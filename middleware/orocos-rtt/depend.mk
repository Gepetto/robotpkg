# robotpkg depend.mk for:	middleware/orocos-rtt
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROCOS_RTT_DEPEND_MK:=		${OROCOS_RTT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		orocos-rtt
endif

ifeq (+,$(OROCOS_RTT_DEPEND_MK)) # ------------------------------------------

PREFER.orocos-rtt?=		robotpkg

DEPEND_USE+=		orocos-rtt

DEPEND_ABI.orocos-rtt?=	orocos-rtt>=2.6.0
DEPEND_DIR.orocos-rtt?=	../../middleware/orocos-rtt

SYSTEM_SEARCH.orocos-rtt=\
	include/rtt/RTT.hpp					\
	lib/liborocos-rtt-gnulinux.so		\
	lib/pkgconfig/orocos-rtt-gnulinux.pc

endif # OROCOS_RTT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

