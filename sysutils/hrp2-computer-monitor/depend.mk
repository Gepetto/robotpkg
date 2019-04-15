# robotpkg depend.mk for:	sysutils/hrp2-computer-monitor
# Created:			Olivier Stasse on Wed, 17 Jun 2015
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
HRP2_COMPUTER_MONITOR_DEPEND_MK:=	${HRP2_COMPUTER_MONITOR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				hrp2-computer-monitor
endif

ifeq (+,$(HRP2_COMPUTER_MONITOR_DEPEND_MK)) # ------------------------------

PREFER.hrp2-computer-monitor?=		robotpkg

SYSTEM_SEARCH.hrp2-computer-monitor=\
  'lib/pkgconfig/hrp2_computer_monitor.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=				hrp2-computer-monitor

DEPEND_ABI.hrp2-computer-monitor?=	hrp2-computer-monitor>=1.0.0
DEPEND_DIR.hrp2-computer-monitor?=	../../sysutils/hrp2-computer-monitor

endif # HRP2_COMPUTER_MONITOR_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
