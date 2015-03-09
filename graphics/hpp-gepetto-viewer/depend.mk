# robotpkg depend.mk for:	graphics/hpp-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPGEPETTOVIEWER_DEPEND_MK:=	${HPPGEPETTOVIEWER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-gepetto-viewer
endif

ifeq (+,$(HPPGEPETTOVIEWER_DEPEND_MK)) # ---------------------------

PREFER.hpp-gepetto-viewer?=	robotpkg

DEPEND_USE+=		hpp-gepetto-viewer

DEPEND_ABI.hpp-gepetto-viewer?=	hpp-gepetto-viewer>=1.0.0
DEPEND_DIR.hpp-gepetto-viewer?=	../../graphics/hpp-gepetto-viewer

SYSTEM_SEARCH.hpp-gepetto-viewer=			\
	'lib/pkgconfig/hpp-gepetto-viewer.pc:/Version/s/[^0-9.]//gp'

endif # HPPGEPETTOVIEWER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
