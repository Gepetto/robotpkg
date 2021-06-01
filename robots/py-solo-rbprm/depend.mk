# robotpkg depend.mk for:	robots/py39-solo-rbprm
# Created:			Guilhem Saurel on Tue,  1 Jun 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_SOLO_RBPRM_DEPEND_MK:=	${PY_SOLO_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-solo-rbprm
endif

ifeq (+,$(PY_SOLO_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-solo-rbprm?=	robotpkg

DEPEND_USE+=			py-solo-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-solo-rbprm?=	${PKGTAG.python-}solo-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-solo-rbprm?=	../../robots/py-solo-rbprm

SYSTEM_SEARCH.py-solo-rbprm=									\
	'include/hpp/solo-rbprm/config.hh:/HPP_SOLO_RBPRM_VERSION /s/[^0-9.]//gp'		\
	'lib/cmake/solo-rbprm/solo-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/solo-rbprm.pc:/Version/s/[^0-9.]//gp'					\
	'share/solo-rbprm/package.xml:/<version>/s/[^0-9.]//gp'					\
	'${PYTHON_SYSLIBSEARCH}/solo_rbprm/__init__.py'

endif # PY_SOLO_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
