# robotpkg depend.mk for:	supervision/python-genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_PYTHON_GENOMIX_DEPEND_MK:=	${PY_PYTHON_GENOMIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-python-genomix
endif

ifeq (+,$(PY_PYTHON_GENOMIX_DEPEND_MK)) # ----------------------------------

DEPEND_USE+=			py-python-genomix
PREFER.py-python-genomix?=	robotpkg

SYSTEM_SEARCH.py-python-genomix=\
  'share/py-python-genomix/pkgIndex.tcl'				\
  '/pkgconfig/py-python-genomix.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.py-python-genomix?=	py-python-genomix>=1.0
DEPEND_DIR.py-python-genomix?=	../../supervision/py-python-genomix

endif # PY_PYTHON_GENOMIX_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
