# robotpkg depend.mk for:	graphics/qt-qgv
# Created:			Guilhem Saurel on Thu, 24 Jan 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT_QGV_DEPEND_MK:=	${QT_QGV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt-qgv
endif

ifeq (+,$(QT_QGV_DEPEND_MK)) # ---------------------------------------------

PREFER.qt-qgv?=		robotpkg

SYSTEM_SEARCH.qt-qgv=\
  'include/qgv/config.hh:/QGV_VERSION /s/[^0-9.]//gp'	\
  'lib/libqgvcore.so'					\
  'lib/pkgconfig/qgv.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		qt-qgv

# depend on appropriate Qt version when using Qt, all versions otherwise.
_qt-qgv_qts={qt4,qt5}
_qt-qgv_qt=\
  $(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_qt-qgv_qts})

DEPEND_ABI.qt-qgv?=	${_qt-qgv_qt}-qgv>=1.1.0
DEPEND_DIR.qt-qgv?=	../../graphics/qt-qgv

endif # QT_QGV_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
