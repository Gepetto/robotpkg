# robotpkg depend.mk for:	robots/py39-hpp-universal-robot
# Created:			Guilhem Saurel on Tue, 13 Apr 2021
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
PY_HPP_UNIVERSAL_ROBOT_DEPEND_MK:=	${PY_HPP_UNIVERSAL_ROBOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				py-hpp-universal-robot
endif

ifeq (+,$(PY_HPP_UNIVERSAL_ROBOT_DEPEND_MK)) # --------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-universal-robot?=		robotpkg

DEPEND_USE+=				py-hpp-universal-robot

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-universal-robot?=	${PKGTAG.python-}hpp-universal-robot>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-universal-robot?=	../../robots/py-hpp-universal-robot

SYSTEM_SEARCH.py-hpp-universal-robot=									\
  'include/hpp/universal/robot/config.hh:HPP_UNIVERSAL_ROBOT_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/hpp-universal-robot/hpp-universal-robotConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp-universal-robot.pc:/Version/s/[^0-9.]//gp'						\
  'share/hpp-universal-robot/package.xml:/<version>/s/[^0-9.]//gp'					\
  '${PYTHON_SYSLIBSEARCH}/hpp/corbaserver/ur5/robot.py'

endif # PY_HPP_UNIVERSAL_ROBOT_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
