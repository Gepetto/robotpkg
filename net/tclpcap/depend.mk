# robotpkg depend.mk for:	net/tclpcap
# Created:			Matthieu Herrb on Thu, 5 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCLPCAP_DEPEND_MK:=	${TCLPCAP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tclpcap
endif

ifeq (+,$(TCLPCAP_DEPEND_MK)) # --------------------------------------------

PREFER.tclpcap?=	robotpkg

SYSTEM_SEARCH.tclpcap=	lib/tclpcap0.1

DEPEND_USE+=		tclpcap
DEPEND_ABI.tclpcap?=	tclpcap>=2.0.0
DEPEND_DIR.tclpcap?=	../../net/tclpcap

endif # TCLPCAP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
