# robotpkg depend.mk for:	robots/py39-hpp-baxter
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_BAXTER_DEPEND_MK:=	${PY_HPP_BAXTER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-baxter
endif

ifeq (+,$(PY_HPP_BAXTER_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-baxter?=		robotpkg

DEPEND_USE+=			py-hpp-baxter

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-baxter?=	${PKGTAG.python-}hpp-baxter>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-baxter?=	../../robots/py-hpp-baxter

SYSTEM_SEARCH.py-hpp-baxter=								\
  'include/hpp/baxter/config.hh:/HPP_BAXTER /s/[^0-9.]//gp'				\
  'lib/cmake/hpp-baxter/hpp-baxterConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp-baxter.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-baxter/package.xml:/<version>/s/[^0-9.]//gp'				\
  '${PYTHON_SYSLIBSEARCH}/hpp/corbaserver/baxter/robot.py'

endif # PY_HPP_BAXTER_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
