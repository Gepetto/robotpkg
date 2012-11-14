# robotpkg sysdep/tcl85.mk
# Created:			Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL85_DEPEND_MK:=	${TCL85_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl85
endif

ifeq (+,$(TCL85_DEPEND_MK)) # ----------------------------------------------

include ../../mk/sysdep/tcl.mk
PREFER.tcl85?=		${PREFER.tcl}

DEPEND_USE+=		tcl85

DEPEND_ABI.tcl85?=	tcl85>=8.5<8.6

SYSTEM_SEARCH.tcl85=	${_tcl_syssearch}

SYSTEM_PKG.Fedora.tcl85=tcl-devel
SYSTEM_PKG.Ubuntu.tcl85=tcl-dev
SYSTEM_PKG.Debian.tcl85=tcl-dev

endif # TCL85_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
