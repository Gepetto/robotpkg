# robotpkg sysdep/py-qt4.mk
# Created:			Anthony Mallet on Fri Jun 28 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_QT4_DEPEND_MK:=	${PY_QT4_DEPEND_MK}+

include ../../mk/sysdep/python.mk

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		py-qt4
endif

ifeq (+,$(PY_QT4_DEPEND_MK)) # ---------------------------------------------

PREFER.py-qt4?=		system

DEPEND_USE+=		py-qt4

DEPEND_ABI.py-qt4?=	${PKGTAG.python}-qt4>=4

SYSTEM_SEARCH.py-qt4=\
  'share/sip{,${PYTHON_VERSION}}/{,PyQt4}/QtCore/QtCoremod.sip'		\
  '${PYTHON_SYSLIBSEARCH}/PyQt4/Qt.so'					\
  '${PYTHON_SYSLIBSEARCH}/PyQt4/__init__.py'				\
  '${PYTHON_SYSLIBSEARCH}/PyQt4/pyqtconfig.py:/pyqt_version_str/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.py-qt4=	python-qt4-dev (python-${PYTHON_VERSION})
SYSTEM_PKG.Fedora.py-qt4=	PyQt4-devel (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-qt4=	x11/${PKGTAG.python}-qt4
SYSTEM_PKG.Ubuntu.py-qt4=	python-qt4-dev (python-${PYTHON_VERSION})

endif # PY_QT4_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
