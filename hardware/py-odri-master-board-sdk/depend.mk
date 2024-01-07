# robotpkg depend.mk for:	hardware/py-odri-master-board-sdk
# Created:			Olivier Stasse on Sun, 7 Jan 2024
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_ODRI_MBSDK_DEPEND_MK:=	${PY_ODRI_MBSDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-odri-master-board-sdk
endif

ifeq (+,$(PY_ODRI_MBSDK_DEPEND_MK)) # --------------------------------------

DEPEND_USE+=		py-odri-master-board-sdk

DEPEND_ABI.py-odri-master-board-sdk?=\
  ${PKGTAG.python-}odri-master-board-sdk>=1
DEPEND_DIR.py-odri-master-board-sdk?= ../../hardware/py-odri-master-board-sdk

SYSTEM_SEARCH.py-odri-master-board-sdk=\
  'include/master_board_sdk/master_board_interface.h' \
  'lib/pkgconfig/master_board_sdk.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
