# robotpkg depend.mk for:	supervision/tcl-genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
TCL_TCL-GENOMIX_DEPEND_MK:=	${TCL_TCL-GENOMIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl-genomix
endif

ifeq (+,$(TCL_TCL-GENOMIX_DEPEND_MK)) # ----------------------------------------

DEPEND_USE+=		tcl-genomix
PREFER.tcl-genomix?=	robotpkg

SYSTEM_SEARCH.tcl-genomix=\
	share/tcl-genomix/pkgIndex.tcl				\
	'/pkgconfig/tcl-genomix.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.tcl-genomix?=	tcl-genomix>=1.2
DEPEND_DIR.tcl-genomix?=	../../wip/tcl-genomix

endif # TCL_TCL-GENOMIX_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
