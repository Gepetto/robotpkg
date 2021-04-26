# robotpkg depend.mk for:	path/py39-hpp-rbprm
# Created:			Guilhem Saurel on Wed, 14 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_RBPRM_DEPEND_MK:=	${PY_HPP_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-rbprm
endif

ifeq (+,$(PY_HPP_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-rbprm?=		robotpkg

DEPEND_USE+=			py-hpp-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-rbprm?=	${PKGTAG.python-}hpp-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-rbprm?=	../../path/py-hpp-rbprm

SYSTEM_SEARCH.py-hpp-rbprm=									\
	'include/hpp/rbprm/config.hh:/HPP_RBPRM /s/[^0-9.]//gp'					\
	'lib/cmake/hpp-rbprm/hpp-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-rbprm.so'									\
	'lib/pkgconfig/hpp-rbprm.pc:/Version/s/[^0-9.]//gp'					\
	'share/hpp-rbprm/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
