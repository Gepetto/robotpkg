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

DEPEND_ABI.py-hpp-practicals?=	${PKGTAG.python-}hpp-practicals>=4.7.0
DEPEND_DIR.py-hpp-practicals?=	../../doc/py-hpp-practicals

SYSTEM_SEARCH.py-hpp-practicals=\
  'include/hpp/practicals/config.hh'				\
  'share/hpp_practicals/urdf/ur5_gripper.urdf'			\
  'lib/pkgconfig/hpp_practicals.pc:/Version/s/[^0-9.]//gp'

endif # PY_HPP_PRACTICALS_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
