# robotpkg depend.mk for:	math/geometric-tools
# Created:			Antonio El Khoury on Tue, 7 Feb 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GEOMETRICTOOLS_DEPEND_MK:=${GEOMETRICTOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		geometric-tools
endif

ifeq (+,$(GEOMETRICTOOLS_DEPEND_MK)) # ---------------------------------

PREFER.geometric-tools?=	robotpkg

DEPEND_USE+=		geometric-tools

DEPEND_ABI.geometric-tools?=geometric-tools>=5.7
DEPEND_DIR.geometric-tools?=../../math/geometric-tools

SYSTEM_SEARCH.geometric-tools=\
	include/geometric-tools/Wm5Core.h \
	include/geometric-tools/Wm5Mathematics.h

endif # GEOMETRICTOOLS_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
