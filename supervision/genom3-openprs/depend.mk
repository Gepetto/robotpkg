# robotpkg depend.mk for:	architecture/genom3-openprs
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM3_OPENPRS_DEPEND_MK:=	${GENOM3_OPENPRS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom3-openprs
endif

ifeq (+,$(GENOM3_OPENPRS_DEPEND_MK)) # ------------------------------------

DEPEND_USE+=		genom3-openprs
PREFER.genom3-openprs?=robotpkg


SYSTEM_SEARCH.genom3-openprs=\
	share/genom/site-templates/openprs/client/template.tcl		\
	share/genom/site-templates/openprs/client/EncodeDecodeOpenprs.c	\
	share/genom/site-templates/openprs/client/RequestOpenprs.c

DEPEND_ABI.genom3-openprs?=	genom3-openprs>=1.0
DEPEND_DIR.genom3-openprs?=	../../supervision/genom3-openprs

endif # GENOM3_OPENPRS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
