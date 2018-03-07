# robotpkg depend.mk for:	scripts/py-sot-application
# Created:			Aurélie Clodic on Wed, 10 Jun 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_SOT_APPLICATION_DEPEND_MK:=	${PY_SOT_APPLICATION_DEPEND_MK}+

ifeq (+,${DEPEND_DEPTH})
DEPEND_PKG+=			py-sot-application
endif

ifeq (+,${PY_SOT_APPLICATION_DEPEND_MK}) # ---------------------------------

PREFER.py-sot-application?=	robotpkg

SYSTEM_SEARCH.py-sot-application=\
  'include/sot/application/config.h:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/dynamic_graph/sot/application/__init__.py'	\
  'lib/pkgconfig/sot-application.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			py-sot-application

DEPEND_ABI.py-sot-application?=	${PKGTAG.python-}sot-application>=1.0.0
DEPEND_DIR.py-sot-application?=	../../scripts/py-sot-application

include ../../mk/sysdep/python.mk

endif # PY_SOT_APPLICATION_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
