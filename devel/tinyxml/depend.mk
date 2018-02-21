# robotpkg depend.mk for:	devel/tinyxml
# Created:			Charles Lesire on Fri, 19 Jan 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TINYXML_DEPEND_MK:=	${TINYXML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tinyxml
endif

ifeq (+,$(TINYXML_DEPEND_MK)) # --------------------------------------------

PREFER.tinyxml?=	system

DEPEND_USE+=		tinyxml

DEPEND_ABI.tinyxml?=	tinyxml
DEPEND_DIR.tinyxml?=	../../devel/tinyxml

SYSTEM_SEARCH.tinyxml=\
  'include/{,tinyxml/}tinyxml.h'	\
  'lib/libtinyxml.{so,a}'

endif # TINYXML_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
