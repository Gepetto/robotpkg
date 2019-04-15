# robotpkg depend.mk for:	robots/hrp2-machine
# Created:			Olivier Stasse on Wed, 22 Jun 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HRP2_MACHINE_DEPEND_MK:=	${HRP2_MACHINE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hrp2-machine
endif

ifeq (+,$(HRP2_MACHINE_DEPEND_MK)) # ---------------------------------------

PREFER.hrp2-machine?=		robotpkg

SYSTEM_SEARCH.hrp2-machine=\
  'lib/pkgconfig/hrp2_machine.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			hrp2-machine

DEPEND_ABI.hrp2-machine?=	hrp2-machine>=1.0.0
DEPEND_DIR.hrp2-machine?=	../../robots/hrp2-machine

endif # HRP2_MACHINE_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
