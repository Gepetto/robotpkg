# robotpkg depend.mk for:	graphics/py-qt-gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_QT_GEPETTO_VIEWER_DEPEND_MK:=	${PY_QT_GEPETTO_VIEWER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-qt-gepetto-viewer
endif

ifeq (+,$(PY_QT_GEPETTO_VIEWER_DEPEND_MK)) # ---------------------------

PREFER.py-qt-gepetto-viewer?=		robotpkg

DEPEND_USE+=				py-qt-gepetto-viewer

DEPEND_ABI.py-qt-gepetto-viewer?=	${PKGTAG.python}-${PKGTAG.qt}-gepetto-viewer>=4.6.0
DEPEND_DIR.py-qt-gepetto-viewer?=	../../graphics/py-qt-gepetto-viewer

SYSTEM_SEARCH.py-qt-gepetto-viewer=								\
  'bin/gepetto-gui'										\
  'include/gepetto/viewer/config.hh:/GEPETTO_VIEWER_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/gepetto-viewer/gepetto-viewerConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/libgepetto-viewer.so'									\
  'lib/pkgconfig/gepetto-viewer.pc:/Version/s/[^0-9.]//gp'					\
  'share/gepetto-viewer/package.xml:/<version>/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk

endif # PY_QT_GEPETTO_VIEWER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
