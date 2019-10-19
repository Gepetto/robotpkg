# robotpkg depend.mk for:	middleware/py-omniorbpy
# Created:			Anthony Mallet on Thu, 13 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_OMNIORBPY_DEPEND_MK:=${PY_OMNIORBPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-omniORBpy
endif

ifeq (+,$(PY_OMNIORBPY_DEPEND_MK)) # ---------------------------------------

include ../../mk/robotpkg.prefs.mk  # for OPSYS
ifeq (Ubuntu,${OPSYS})
  PREFER.py-omniORBpy?=	$(if $(filter 3,${PYTHON_MAJOR}),robotpkg,system)
endif
PREFER.py-omniORBpy?=	system
PREFER.omniORB?=	${PREFER.py-omniORBpy}

DEPEND_USE+=		py-omniORBpy

DEPEND_ABI.py-omniORBpy?=	${PKGTAG.python-}omniORBpy
DEPEND_DIR.py-omniORBpy?=	../../middleware/py-omniORBpy

SYSTEM_SEARCH.py-omniORBpy=\
  '{${PYTHON_SYSLIBSEARCH},lib/omniidl}/omniidl_be/python.py'

# need omniidl_be in PYTHONPATH
PYTHONPATH.py-omniORBpy+=	$(dir ${SYSTEM_FILES.py-omniORBpy})/..

SYSTEM_PKG.Arch.py-omniORBpy =	omniorbpy (AUR)
SYSTEM_PKG.Debian.py-omniORBpy =python-omniorb omniidl-python
SYSTEM_PKG.NetBSD.py-omniORBpy =net/omniORB
SYSTEM_PKG.RedHat.py-omniORBpy =py-omniorbpy-devel (python${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

endif # PY_OMNIORBPY_DEPEND_MK ---------------------------------------------

include ../../middleware/omniORB/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
