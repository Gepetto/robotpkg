# robotpkg depend.mk for:	path/py-hpp-tutorial
# Created:			Florent Lamiraux on Thu, 12 Mar 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_TUTORIAL_DEPEND_MK:=	${PY_HPP_TUTORIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-tutorial
endif

ifeq (+,$(PY_HPP_TUTORIAL_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-tutorial?=	robotpkg

DEPEND_USE+=			py-hpp-tutorial

DEPEND_ABI.py-hpp-tutorial?=	${PKGTAG.python-}hpp_tutorial>=4.9.0
DEPEND_DIR.py-hpp-tutorial?=	../../doc/py-hpp-tutorial

SYSTEM_SEARCH.py-hpp-tutorial=									\
	'include/hpp/tutorial/config.hh:/HPP_TUTORIAL_VERSION /s/[^0-9.]//gp'			\
	'bin/hpp-tutorial-server'								\
	'lib/cmake/hpp-tutorial/hpp-tutorialConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/pkgconfig/hpp_tutorial.pc:/Version/s/[^0-9.]//gp'					\
	'share/hpp_tutorial/package.xml:/<version>/s/[^0-9.]//gp'

endif # PY_HPP_TUTORIAL_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
