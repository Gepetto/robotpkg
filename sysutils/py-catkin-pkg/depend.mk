# robotpkg depend.mk for:	sysutils/py-catkin-pkg
# Created:			Anthony Mallet on Thu, 20 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_CATKIN_PKG_DEPEND_MK:=	${PY_CATKIN_PKG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-catkin-pkg
endif

ifeq (+,$(PY_CATKIN_PKG_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common

# for python3 and ros versions before noetic, prefer robotpkg as the system
# package will conflict with system ros installation.
PREFER.py-catkin-pkg?=\
  $(if $(filter py3%-kinetic py3%-lunar py3%-melodic,		\
    $(addprefix ${PKGTAG.python-},${PKG_ALTERNATIVE.ros})),	\
      robotpkg,${PREFER.ros-base})
SYSTEM_PREFIX.py-catkin-pkg?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			py-catkin-pkg

DEPEND_ABI.py-catkin-pkg?=	${PKGTAG.python}-catkin-pkg>=0.2
DEPEND_DIR.py-catkin-pkg?=	../../sysutils/py-catkin-pkg

SYSTEM_SEARCH.py-catkin-pkg=\
  'bin/{,python${PYTHON_MAJOR}-,${PKGTAG.python-}}catkin_create_pkg'	\
  '${PYTHON_SYSLIBSEARCH}/catkin_pkg/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.py-catkin-pkg=python$(subst 2,,${PYTHON_MAJOR})-catkin-pkg

include ../../mk/sysdep/py-argparse.mk
include ../../mk/sysdep/py-pyparsing.mk
include ../../mk/sysdep/python.mk

endif # PY_CATKIN_PKG_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
