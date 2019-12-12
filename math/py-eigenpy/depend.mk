# robotpkg depend.mk for:	math/py27-eigenpy
# Created:			Anthony Mallet on Mon,  5 Mar 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_EIGENPY_DEPEND_MK:=	${PY_EIGENPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-eigenpy
endif

ifeq (+,$(PY_EIGENPY_DEPEND_MK)) # -----------------------------------------

PREFER.py-eigenpy?=	robotpkg

SYSTEM_SEARCH.py-eigenpy=\
  'include/eigenpy/config.hpp:/EIGENPY_VERSION /s/[^0-9.]//gp'			\
  'lib/libeigenpy.so'								\
  '${PYTHON_SYSLIBSEARCH}/eigenpy/*.so'						\
  '${PYTHON_SYSLIBSEARCH}/eigenpy/__init__.py'					\
  'lib/cmake/eigenpy/eigenpyConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/eigenpy.pc:/Version/s/[^0-9.]//gp'				\
  'share/eigenpy/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_USE+=		py-eigenpy
DEPEND_ABI.py-eigenpy?=	${PKGTAG.python-}eigenpy>=1.6.12
DEPEND_DIR.py-eigenpy?=	../../math/py-eigenpy

include ../../mk/sysdep/python.mk

endif # PY_EIGENPY_DEPEND_MK -----------------------------------------------

# This package leaks dependencies on boost-python and eigen, numpy ...
# XXX Currently, boost-headers does not allow to specify specific headers to be
# searched, like for boost-libs, so hope for the best with boost-python
# headers.
USE_BOOST_LIBS+=	python

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/py-numpy.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
