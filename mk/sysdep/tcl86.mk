# robotpkg sysdep/tcl86.mk
# Created:			Anthony Mallet on Tue Apr  9 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL86_DEPEND_MK:=	${TCL86_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl86
endif

ifeq (+,$(TCL86_DEPEND_MK)) # ----------------------------------------------

include ../../mk/sysdep/tcl.mk
PREFER.tcl86?=		${PREFER.tcl}

DEPEND_USE+=		tcl86

DEPEND_ABI.tcl86?=	tcl86>=8.6<8.7

SYSTEM_SEARCH.tcl86=	${_tcl_syssearch}

SYSTEM_PKG.Fedora.tcl86=tcl-devel
SYSTEM_PKG.Ubuntu.tcl86=tcl-dev
SYSTEM_PKG.Debian.tcl86=tcl-dev
SYSTEM_PKG.NetBSD.tcl86=lang/tcl

endif # TCL86_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
