# robotpkg depend.mk for:	sysutils/console-bridge
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
CONSOLE_BRIDGE_DEPEND_MK:=	${CONSOLE_BRIDGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			console-bridge
endif

ifeq (+,$(CONSOLE_BRIDGE_DEPEND_MK)) # -------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.console-bridge?=	robotpkg
else ifeq (CentOS,${OPSYS})
  PREFER.console-bridge?=	robotpkg
else ifeq (Debian,${OPSYS})
  ifneq (,$(filter 8,${OS_VERSION}))
    PREFER.console-bridge?=	robotpkg
  endif
endif
PREFER.console-bridge?=		system

DEPEND_USE+=			console-bridge

DEPEND_ABI.console-bridge?=	console-bridge>=0.3
DEPEND_DIR.console-bridge?=	../../sysutils/console-bridge

SYSTEM_SEARCH.console-bridge=\
  'include/console_bridge/console.h'				\
  'lib/libconsole_bridge.so'					\
  'lib/pkgconfig/console_bridge.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.console-bridge=libconsole-bridge-dev
SYSTEM_PKG.Fedora.console-bridge=console-bridge-devel

endif # CONSOLE_BRIDGE_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
