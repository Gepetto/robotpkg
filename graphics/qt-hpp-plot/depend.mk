# robotpkg depend.mk for:	graphics/qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT_HPP_PLOT_DEPEND_MK:=	${QT_HPP_PLOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt-hpp-plot
endif

ifeq (+,$(QT_HPP_PLOT_DEPEND_MK)) # ----------------------------------------

include ../../mk/sysdep/python.mk

PREFER.qt-hpp-plot?=	robotpkg

DEPEND_USE+=		qt-hpp-plot

# depend on appropriate Qt version when using Qt, all versions otherwise.
_hppp_qts={qt4,qt5}
_hppp_qt=\
  $(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_hppp_qts})

DEPEND_ABI.qt-hpp-plot?=	${PKGTAG.python-}${_hppp_qt}-hpp-plot>=4.6.0
DEPEND_DIR.qt-hpp-plot?=	../../graphics/qt-hpp-plot

SYSTEM_SEARCH.qt-hpp-plot=\
  'include/hpp/plot/config.hh'	\
  'lib/libhpp-plot.so'	\
  'lib/pkgconfig/hpp-plot.pc:/Version/s/[^0-9.]//gp'

endif # QT_HPP_PLOT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
