# robotpkg depend.mk for:	robots/py39-talos-rbprm
# Created:			Guilhem Saurel on Wed, 14 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_TALOS_RBPRM_DEPEND_MK:=	${PY_TALOS_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-talos-rbprm
endif

ifeq (+,$(PY_TALOS_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-talos-rbprm?=		robotpkg

DEPEND_USE+=			py-talos-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-talos-rbprm?=	${PKGTAG.python-}talos-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-talos-rbprm?=	../../robots/py-talos-rbprm

SYSTEM_SEARCH.py-talos-rbprm=									\
	'include/hpp/talos-rbprm/config.hh:/HPP_TALOS_RBPRM_VERSION /s/[^0-9.]//gp'		\
	'lib/cmake/talos-rbprm/talos-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/talos-rbprm.pc:/Version/s/[^0-9.]//gp'					\
	'share/talos-rbprm/package.xml:/<version>/s/[^0-9.]//gp'				\
	'${PYTHON_SYSLIBSEARCH}/talos_rbprm/__init__.py'

endif # PY_TALOS_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
