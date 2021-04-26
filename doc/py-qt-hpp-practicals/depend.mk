# robotpkg depend.mk for:	path/py-hpp-practicals
# Created:			Florent Lamiraux on Wed, 29 May 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_PRACTICALS_DEPEND_MK:=	${PY_HPP_PRACTICALS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-practicals
endif

ifeq (+,$(PY_HPP_PRACTICALS_DEPEND_MK)) # -------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-practicals?=	robotpkg

DEPEND_USE+=			py-hpp-practicals

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-practicals?=	${PKGTAG.python-}hpp-practicals>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-practicals?=	../../doc/py-hpp-practicals

SYSTEM_SEARCH.py-hpp-practicals=								\
  'include/hpp/practicals/config.hh:/HPP_PRACTICALS_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/hpp-practicals/hpp-practicalsConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp_practicals.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp_practicals/package.xml:/<version>/s/[^0-9.]//gp'					\
  'share/hpp_practicals/urdf/ur5_gripper.urdf'

endif # PY_HPP_PRACTICALS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
