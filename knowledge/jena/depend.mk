# robotpkg depend.mk for:	knowledge/jena
# Created:			Anthony Mallet on Fri, 12 Jun 2009
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JENA_DEPEND_MK:=	${JENA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jena
endif

ifeq (+,$(JENA_DEPEND_MK)) # -----------------------------------------------

PREFER.jena?=		robotpkg

DEPEND_USE+=		jena
DEPEND_ABI.jena?=	jena>=2.6.4
DEPEND_DIR.jena?=	../../knowledge/jena

SYSTEM_SEARCH.jena=\
	java/jena/lib/jena.jar

endif # JENA_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
