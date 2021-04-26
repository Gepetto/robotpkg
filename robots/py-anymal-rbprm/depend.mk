# robotpkg depend.mk for:	robots/py39-anymal-rbprm
# Created:			Guilhem Saurel on Wed, 14 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ANYMAL_RBPRM_DEPEND_MK:=	${PY_ANYMAL_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-anymal-rbprm
endif

ifeq (+,$(PY_ANYMAL_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-anymal-rbprm?=	robotpkg

DEPEND_USE+=			py-anymal-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-anymal-rbprm?=	${PKGTAG.python-}anymal-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-anymal-rbprm?=	../../robots/py-anymal-rbprm

SYSTEM_SEARCH.py-anymal-rbprm=									\
	'include/hpp/anymal-rbprm/config.hh:/HPP_ANYMAL_RBPRM_VERSION /s/[^0-9.]//gp'		\
	'lib/cmake/anymal-rbprm/anymal-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/anymal-rbprm.pc:/Version/s/[^0-9.]//gp'					\
	'share/anymal-rbprm/package.xml:/<version>/s/[^0-9.]//gp'				\
	'${PYTHON_SYSLIBSEARCH}/anymal_rbprm/__init__.py'

endif # PY_ANYMAL_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
