# robotpkg depend.mk for:	graphics/py38-PythonQt
# Created:			Guilhem Saurel on Wed, 27 May 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_PYTHONQT_DEPEND_MK:=	${PY_PYTHONQT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-pythonqt
endif

ifeq (+,$(PY_PYTHONQT_DEPEND_MK)) # ------------------------------------------

include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.prefs.mk  # for OPSYS

ifeq (18.04,${OS_VERSION})
  PREFER.py-pythonqt?=		system
else ifeq (Arch,${OPSYS})
  PREFER.py-pythonqt?=		system
endif
PREFER.py-pythonqt?=		robotpkg

SYSTEM_SEARCH.py-pythonqt=						\
  'include/PythonQt{,5}/PythonQt.h'					\
  'include/PythonQt{,5}/{,extensions/PythonQt_QtAll/}PythonQt_QtAll.h'	\
  'lib/libPythonQt-Qt5-Python{${PYTHON_VERSION},${PYTHON_MAJOR}}.so'	\
  'lib/libPythonQt_QtAll-Qt5-Python{${PYTHON_VERSION},${PYTHON_MAJOR}}.so'

DEPEND_USE+=			py-pythonqt

DEPEND_ABI.py-pythonqt?=	${PKGTAG.python}-PythonQt>=3.2
DEPEND_DIR.py-pythonqt?=	../../graphics/py-pythonqt

SYSTEM_PKG.Arch.py-pythonqt=	pythonqt (AUR)
SYSTEM_PKG.Ubuntu.py-pythonqt=	libpythonqt-qtall-qt5-python${PYTHON_MAJOR}-dev

endif # PY_PYTHONQT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
