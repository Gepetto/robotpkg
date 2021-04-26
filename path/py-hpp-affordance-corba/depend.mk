# robotpkg depend.mk for:	path/py39-hpp-affordance-corba
# Created:			Guilhem Saurel on Wed, 21 Apr 2021
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_HPP_AFFORDANCE_CORBA_DEPEND_MK:=	${PY_HPP_AFFORDANCE_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-hpp-affordance-corba
endif

ifeq (+,$(PY_HPP_AFFORDANCE_CORBA_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-affordance-corba?=	robotpkg

DEPEND_USE+=				py-hpp-affordance-corba

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-affordance-corba?=	${PKGTAG.python-}hpp-affordance-corba>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-affordance-corba?=	../../path/py-hpp-affordance-corba

SYSTEM_SEARCH.py-hpp-affordance-corba=										\
  'include/hpp/corbaserver/affordance/config.hh:/HPP_AFFORDANCE_CORBA_VERSION /s/[^0-9.]//gp'		\
  'lib/cmake/hpp-affordance-corba/hpp-affordance-corbaConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/hppPlugins/affordance-corba.so'									\
  'lib/pkgconfig/hpp-affordance-corba.pc:/Version/s/[^0-9.]//gp'						\
  'share/hpp-affordance-corba/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_AFFORDANCE_CORBA_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
