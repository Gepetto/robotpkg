# robotpkg depend.mk for:	sysutils/hrp2-bringup
# Created:			Olivier Stasse on Wed, 14 Jav 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HRP2_BRINGUP_DEPEND_MK:=	${HRP2_BRINGUP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hrp2-bringup
endif

ifeq (+,$(HRP2_BRINGUP_DEPEND_MK)) # ---------------------------------------

PREFER.hrp2-bringup?=		robotpkg

SYSTEM_SEARCH.hrp2-bringup=\
  'lib/pkgconfig/hrp2_bringup.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			hrp2-bringup

DEPEND_ABI.hrp2-bringup?=	hrp2-bringup>=1.0.0
DEPEND_DIR.hrp2-bringup?=	../../sysutils/hrp2-bringup

endif # HRP2_14_DESCRIPTION_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
