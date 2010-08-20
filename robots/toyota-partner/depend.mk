# robotpkg depend.mk for:	robots/toyota-partner
# Created:			florent on Fri, 20 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TOYOTA_PARTNER_DEPEND_MK:=	${TOYOTA_PARTNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		toyota-partner
endif

ifeq (+,$(TOYOTA_PARTNER_DEPEND_MK)) # --------------------------------------

PREFER.toyota-partner?=	robotpkg

SYSTEM_SEARCH.toyota-partner=\
	share/toyota-partner/partner-hpp.kxml

DEPEND_USE+=		toyota-partner

DEPEND_ABI.toyota-partner?=	toyota-partner>=1.7.5
DEPEND_DIR.toyota-partner?=	../../robots/toyota-partner

endif # TOYOTA_PARTNER_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
