# robotpkg depend.mk for:	hardware/py-odri-control-interface
# Created:			Olivier Stasse on Tues, 7 May 2024
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ODRI_CONTROL_INTERFACE_DEPEND_MK:=	${PY_ODRI_CONTROL_INTERFACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-odri-control-interface
endif

ifeq (+,$(PY_ODRI_CONTROL_INTERFACE_DEPEND_MK)) # ----------------------------

DEPEND_USE+=		py-odri-control-interface

DEPEND_ABI.py-odri-control-interface?=\
  ${PKGTAG.python-}odri-control-interface>=1
DEPEND_DIR.py-odri-control-interface?= ../../hardware/py-odri-control-interface

SYSTEM_SEARCH.py-odri-control-interface=\
  'include/odri_control_interface/joint_modules.hpp' \
  'lib/pkgconfig/odri_control_interface.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
