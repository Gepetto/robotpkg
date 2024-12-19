# robotpkg depend.mk for:	path/py-hpp-python
# Created:			Guilhem Saurel on Thu, 19 Dec 2024
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_PYTHON_DEPEND_MK:=	${PY_HPP_PYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-python
endif

ifeq (+,$(PY_HPP_PYTHON_DEPEND_MK)) # ------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-python?=		robotpkg

DEPEND_USE+=			py-hpp-python

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-python?=	${PKGTAG.python-}hpp-python>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-python?=	../../path/py-hpp-python

SYSTEM_SEARCH.py-hpp-python=								\
  'include/hpp/python/config.hh:/HPP_PYTHON_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/hpp-python/hpp-pythonConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp-python.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-python/package.xml:/<version>/s/[^0-9.]//gp'

# need omniidl_be in PYTHONPATH
PYTHONPATH.py-hpp-python+=	$(dir ${SYSTEM_FILES.omniORBpy})

include ../../path/hpp-core/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
