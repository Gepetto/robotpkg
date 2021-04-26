# robotpkg depend.mk for:	graphics/py-qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_QT_HPP_PLOT_DEPEND_MK:=	${PY_QT_HPP_PLOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-qt-hpp-plot
endif

ifeq (+,$(PY_QT_HPP_PLOT_DEPEND_MK)) # ----------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-qt-hpp-plot?=		robotpkg

DEPEND_USE+=			py-qt-hpp-plot

# depend on appropriate Qt version when using Qt, all versions otherwise.
_hppp_qts={qt4,qt5}
_hppp_qt=\
  $(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_hppp_qts})

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-qt-hpp-plot?=	${PKGTAG.python-}${_hppp_qt}-hpp-plot>=${HPP_MIN_VERSION}
DEPEND_DIR.py-qt-hpp-plot?=	../../graphics/py-qt-hpp-plot

SYSTEM_SEARCH.py-qt-hpp-plot=								\
  'include/hpp/plot/config.hh:/HPP_PLOT_VERSION /s/[^0-9.]//gp'				\
  'lib/cmake/hpp-plot/hpp-plotConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/libhpp-plot.so'									\
  'lib/pkgconfig/hpp-plot.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-plot/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_QT_HPP_PLOT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
