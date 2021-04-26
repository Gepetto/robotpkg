# robotpkg depend.mk for:	robots/py39-hyq-rbprm
# Created:			Guilhem Saurel on Wed, 14 Apr 2021
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HYQ_RBPRM_DEPEND_MK:=	${PY_HYQ_RBPRM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hyq-rbprm
endif

ifeq (+,$(PY_HYQ_RBPRM_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hyq-rbprm?=		robotpkg

DEPEND_USE+=			py-hyq-rbprm

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hyq-rbprm?=	${PKGTAG.python-}hyq-rbprm>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hyq-rbprm?=	../../robots/py-hyq-rbprm

SYSTEM_SEARCH.py-hyq-rbprm=									\
	'include/hpp/hyq-rbprm/config.hh:/HPP_HYQ_RBPRM_VERSION /s/[^0-9.]//gp'			\
	'lib/cmake/hyq-rbprm/hyq-rbprmConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/hyq-rbprm.pc:/Version/s/[^0-9.]//gp'					\
	'share/hyq-rbprm/package.xml:/<version>/s/[^0-9.]//gp'					\
	'${PYTHON_SYSLIBSEARCH}/hyq_rbprm/__init__.py'

endif # PY_HYQ_RBPRM_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
