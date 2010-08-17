# robotpkg depend.mk for:	math/tvmet
# Created:			Anthony Mallet on Thu, 2 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TVMET_DEPEND_MK:=	${TVMET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tvmet
endif

ifeq (+,$(TVMET_DEPEND_MK)) # ----------------------------------------

PREFER.tvmet?=		robotpkg

DEPEND_USE+=		tvmet

DEPEND_ABI.tvmet?=	tvmet>=1.7.2
DEPEND_DIR.tvmet?=	../../math/tvmet

SYSTEM_SEARCH.tvmet=\
	bin/tvmet-config	\
	include/tvmet/tvmet.h

endif # TVMET_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
