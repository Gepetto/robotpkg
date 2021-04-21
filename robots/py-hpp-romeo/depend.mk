# robotpkg depend.mk for:	robots/py39-hpp-romeo
# Created:			Guilhem Saurel on Wed, 21 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_ROMEO_DEPEND_MK:=	${PY_HPP_ROMEO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-romeo
endif

ifeq (+,$(PY_HPP_ROMEO_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-romeo?=		robotpkg

DEPEND_USE+=			py-hpp-romeo

DEPEND_ABI.py-hpp-romeo?=	${PKGTAG.python-}hpp-romeo>=4.9.0
DEPEND_DIR.py-hpp-romeo?=	../../robots/py-hpp-romeo

SYSTEM_SEARCH.py-hpp-romeo=								\
  'include/hpp/romeo/util.hh:/HPP_ROMEO_VERSION /s/[^0-9.]//gp'				\
  'lib/cmake/hpp-romeo/hpp-romeoConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp_romeo.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp_romeo/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_ROMEO_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
