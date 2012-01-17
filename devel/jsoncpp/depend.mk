# robotpkg depend.mk for:	devel/jsoncpp
# Created:			Anthony Mallet on Tue, 18 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JSONCPP_DEPEND_MK:=	${JSONCPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jsoncpp
endif

ifeq (+,$(JSONCPP_DEPEND_MK)) # --------------------------------------------

PREFER.jsoncpp?=	robotpkg

DEPEND_USE+=		jsoncpp

DEPEND_ABI.jsoncpp?=	jsoncpp>=0.5.0
DEPEND_DIR.jsoncpp?=	../../devel/jsoncpp

SYSTEM_SEARCH.jsoncpp=\
	include/json/json.h	\
	'lib/libjson.{so,a}'

endif # JSONCPP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
