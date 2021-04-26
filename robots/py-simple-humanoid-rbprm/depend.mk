# robotpkg depend.mk for:	robots/py39-simple-humanoid-rbprm
# Created:			Guilhem Saurel on Wed, 14 Apr 2021
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_SIMPLE_HUMANOID_RBPRM_DEPEND_MK:=	${PY_SIMPLE_HUMANOID_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-simple-humanoid-rbprm
endif

ifeq (+,$(PY_SIMPLE_HUMANOID_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-simple-humanoid-rbprm?=	robotpkg

DEPEND_USE+=				py-simple-humanoid-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-simple-humanoid-rbprm?=	${PKGTAG.python-}simple-humanoid-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-simple-humanoid-rbprm?=	../../robots/py-simple-humanoid-rbprm

SYSTEM_SEARCH.py-simple-humanoid-rbprm=											\
	'include/hpp/simple-humanoid-rbprm/config.hh:/HPP_SIMPLE_HUMANOID_RBPRM_VERSION /s/[^0-9.]//gp'			\
	'lib/cmake/simple-humanoid-rbprm/simple-humanoid-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/simple-humanoid-rbprm.pc:/Version/s/[^0-9.]//gp'							\
	'share/simple-humanoid-rbprm/package.xml:/<version>/s/[^0-9.]//gp'						\
	'${PYTHON_SYSLIBSEARCH}/simple_humanoid_rbprm/__init__.py'

endif # PY_SIMPLE_HUMANOID_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
