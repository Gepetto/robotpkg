# robotpkg depend.mk for:	graphics/qt-hpp-gui
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT_HPP_GUI_DEPEND_MK:=	${QT_HPP_GUI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qt-hpp-gui
endif

ifeq (+,$(QT_HPP_GUI_DEPEND_MK)) # -----------------------------------------

include ../../mk/sysdep/python.mk

PREFER.qt-hpp-gui?=	robotpkg

DEPEND_USE+=		qt-hpp-gui

# depend on appropriate Qt version when using Qt, all versions otherwise.
_hppg_qts={qt4,qt5}
_hppg_qt=$(if $(filter qt,${PKG_ALTERNATIVES}),${PKG_ALTERNATIVE.qt},${_hppg_qts})

DEPEND_ABI.qt-hpp-gui?=	${PKGTAG.python-}${_hppg_qt}-hpp-gui>=4.6.1
DEPEND_DIR.qt-hpp-gui?=	../../graphics/qt-hpp-gui

SYSTEM_SEARCH.qt-hpp-gui=\
 'include/hpp/gui/config.hh'				\
 'lib/pkgconfig/hpp-gui.pc:/Version/s/[^0-9.]//gp'

endif # QT_HPP_GUI_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
