# robotpkg sysdep/py-qt5.mk
# Created:			Anthony Mallet on Fri Jun 28 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_QT5_DEPEND_MK:=	${PY_QT5_DEPEND_MK}+

include ../../mk/sysdep/python.mk

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		py-qt5
endif

ifeq (+,$(PY_QT5_DEPEND_MK)) # ---------------------------------------------

PREFER.py-qt5?=		system

DEPEND_USE+=		py-qt5
DEPEND_ABI.py-qt5?=	${PKGTAG.python}-qt5

SYSTEM_SEARCH.py-qt5=\
  '{share/sip{,${PYTHON_VERSION}},${PYTHON_SYSLIBSEARCH}}/PyQt5/{,bindings/}QtCore/QtCoremod.sip'	\
  '{share/sip{,${PYTHON_VERSION}},${PYTHON_SYSLIBSEARCH}}/PyQt5/{,bindings/}QtGui/QtGuimod.sip'		\
  '${PYTHON_SYSLIBSEARCH}/PyQt5/Qt{,.*}.so'								\
  '${PYTHON_SYSLIBSEARCH}/PyQt5/__init__.py'

SYSTEM_PKG.Arch.py-qt5=python$(subst 3,,${PYTHON_MAJOR})-pyqt5
SYSTEM_PKG.Debian.py-qt5=python$(subst 2,,${PYTHON_MAJOR})-pyqt5 pyqt5-dev
SYSTEM_PKG.Fedora.py-qt5=PyQt5-devel (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-qt5=x11/${PKGTAG.python}-qt5

endif # PY_QT5_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
