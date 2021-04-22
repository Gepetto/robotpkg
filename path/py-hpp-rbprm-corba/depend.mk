# robotpkg depend.mk for:	path/py39-hpp-rbprm-corba
# Created:			Guilhem Saurel on Thu, 22 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_RBPRM_CORBA_DEPEND_MK:=	${PY_HPP_RBPRM_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-rbprm-corba
endif

ifeq (+,$(PY_HPP_RBPRM_CORBA_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-rbprm-corba?=	robotpkg

DEPEND_USE+=			py-hpp-rbprm-corba

DEPEND_ABI.py-hpp-rbprm-corba?=	${PKGTAG.python-}hpp-rbprm-corba>=4.9.0
DEPEND_DIR.py-hpp-rbprm-corba?=	../../path/py-hpp-rbprm-corba

SYSTEM_SEARCH.py-hpp-rbprm-corba=									\
	'include/hpp/corbaserver/rbprm/config.hh:/HPP_RBPRM_CORBA_VERSION /s/[^0-9.]//gp'		\
	'lib/cmake/hpp-rbprm-corba/hpp-rbprm-corbaConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/hppPlugins/rbprm-corba.so'									\
	'lib/pkgconfig/hpp-rbprm-corba.pc:/Version/s/[^0-9.]//gp'					\
	'share/hpp-rbprm-corba/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_RBPRM_CORBA_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
