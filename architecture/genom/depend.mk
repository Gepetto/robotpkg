#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Authored by Anthony Mallet on Wed Apr 23 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM_DEPEND_MK:=	${GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom
endif

ifeq (+,$(GENOM_DEPEND_MK)) # ----------------------------------------

PREFER.genom?=		robotpkg

SYSTEM_SEARCH.genom=\
	bin/genom		\
	include/genom/modules.h	\
	lib/libgenom.la

DEPEND_USE+=		genom

DEPEND_ABI.genom?=	genom>=2.0r2
DEPEND_DIR.genom?=	../../architecture/genom

TOOLS.genom?=		${PREFIX.genom}/bin/genom
GENOM_ARGS?=#		empty

# Add genom-related options
PKG_SUPPORTED_OPTIONS+=	tcl
PKG_SUGGESTED_OPTIONS+=	tcl

PKG_OPTION_DESCR.tcl=	Enable the generation of the TCL client code
define PKG_OPTION_SET.tcl
	GENOM_ARGS+=	-t
endef
define PKG_OPTION_UNSET.tcl
	GENOM_ARGS:=	$(filter-out -t,${GENOM_ARGS})
endef

ifdef GENOM_MODULE
pre-configure: genom-generate

.PHONY: genom-generate
genom-generate:
	@${STEP_MSG} "Generating ${GENOM_MODULE} module"
	${RUN}cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV}	\
	${TOOLS.genom} ${GENOM_ARGS} ${GENOM_MODULE}
endif # GENOM_MODULE

endif # GENOM_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
