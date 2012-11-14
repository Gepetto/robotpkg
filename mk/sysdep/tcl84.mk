# robotpkg sysdep/tcl84.mk
# Created:			Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL84_DEPEND_MK:=	${TCL84_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl84
endif

ifeq (+,$(TCL84_DEPEND_MK)) # ----------------------------------------------

include ../../mk/sysdep/tcl.mk
PREFER.tcl84?=		${PREFER.tcl}

DEPEND_USE+=		tcl84

DEPEND_ABI.tcl84?=	tcl84>=8.4<8.5

SYSTEM_SEARCH.tcl84=	${_tcl_syssearch}

SYSTEM_PKG.Fedora.tcl84=tcl-devel
SYSTEM_PKG.Ubuntu.tcl84=tcl-dev
SYSTEM_PKG.Debian.tcl84=tcl-dev

endif # TCL84_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
