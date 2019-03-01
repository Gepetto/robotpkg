# robotpkg depend.mk for:	graphics/hpp-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_GEPETTO_VIEWER_DEPEND_MK:=	${HPP_GEPETTO_VIEWER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-gepetto-viewer
endif

ifeq (+,$(HPP_GEPETTO_VIEWER_DEPEND_MK)) # ---------------------------

PREFER.hpp-gepetto-viewer?=	robotpkg

DEPEND_USE+=		hpp-gepetto-viewer

# depend on appropriate Qt version when using Qt, all versions otherwise.
_hgv_qts={qt4,qt5}
_hgv_qt=$(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_hgv_qts})

DEPEND_ABI.hpp-gepetto-viewer?=	${PKGTAG.python}-${_hgv_qt}-hpp-gepetto-viewer>=4.2.0
DEPEND_DIR.hpp-gepetto-viewer?=	../../graphics/hpp-gepetto-viewer

SYSTEM_SEARCH.hpp-gepetto-viewer=			\
	'lib/pkgconfig/hpp-gepetto-viewer.pc:/Version/s/[^0-9.]//gp'

endif # HPP_GEPETTO_VIEWER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
