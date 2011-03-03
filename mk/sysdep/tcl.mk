#
# Copyright (c) 2008-2011 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Oct 23 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TCL_DEPEND_MK:=		${TCL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tcl
endif

ifeq (+,$(TCL_DEPEND_MK)) # ------------------------------------------

PREFER.tcl?=		system

DEPEND_USE+=		tcl

DEPEND_ABI.tcl?=	tcl>=8.0

SYSTEM_SEARCH.tcl=	\
	'bin/tclsh{,[0-9.]*}'						\
	'lib/{,tcl{,[0-9]*}/}tclConfig.sh:/TCL_VERSION/s/[^.0-9]//gp'	\
	'include/{,tcl{,[0-9]*}/}tcl.h:/TCL_VERSION/s/[^.0-9]//gp'

SYSTEM_PKG.Linux-fedora.tcl=	tcl-devel
SYSTEM_PKG.Linux-ubuntu.tcl=	tcl-dev
SYSTEM_PKG.Linux-debian.tcl=	tcl-dev

export TCLSH=		$(word 1,${SYSTEM_FILES.tcl})
TCL_CONFIG_SH=		$(word 2,${SYSTEM_FILES.tcl})

# TCLPATH.<pkg> is a list of subdirectories of PREFIX.<pkg> (or absolute
# directories) that should be added to the tcl search paths.
#
_TCL_SYSPATH:=$(if ${TCLSH},						\
  $(shell ${SETENV} TCLLIBPATH= ${ECHO} 'puts $$auto_path' |		\
    ${TCLSH} 2>/dev/null))

TCLLIBPATH=$(filter-out ${_TCL_SYSPATH},				\
	$(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},			\
	  $(addprefix							\
	    ${PREFIX.${_pkg_}}/, $(patsubst ${PREFIX.${_pkg_}}/%,%,	\
	    $(or ${TCLPATH.${_pkg_}},					\
	      $(dir $(filter %/pkgIndex.tcl,${SYSTEM_FILES.${_pkg_}}))	\
	))))))
export TCLLIBPATH

endif # TCL_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
