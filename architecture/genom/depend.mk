# $LAAS: depend.mk 2010/07/15 18:46:21 mallet $
#
# Copyright (c) 2008-2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Wed Apr 23 2008
#

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
PKG_SUPPORTED_OPTIONS+=	api tcl openprs
PKG_SUGGESTED_OPTIONS+=	tcl

PKG_OPTION_DESCR.api=	Generate module API only
define PKG_OPTION_SET.api
  GENOM_ARGS+=	-a
endef
_PKG_OPTIONS_UNSET.api:=${PKG_OPTIONS_UNSET.api}
define PKG_OPTION_UNSET.api
  ${_PKG_OPTIONS_UNSET.api}
  GENOM_ARGS:=	$(filter-out -a,${GENOM_ARGS})
endef

PKG_OPTION_DESCR.tcl=	Enable the generation of the TCL client code
define PKG_OPTION_SET.tcl
  GENOM_ARGS+=	-t
  REQD_BUILD_OPTIONS.genom+=	tcl
  include ../../mk/sysdep/tcl.mk
endef
define PKG_OPTION_UNSET.tcl
  GENOM_ARGS:=	$(filter-out -t,${GENOM_ARGS})
endef

PKG_OPTION_DESCR.openprs=Enable the generation of the OpenPRS client code
define PKG_OPTION_SET.openprs
  GENOM_ARGS+=	-o
  include ../../architecture/transgen/depend.mk
endef
define PKG_OPTION_UNSET.openprs
  GENOM_ARGS:=	$(filter-out -o,${GENOM_ARGS})
endef

ifdef GENOM_MODULE
  GNU_CONFIGURE=	yes

  pre-configure: genom-generate

  .PHONY: genom-generate
  genom-generate:
	@${STEP_MSG} "Generating ${GENOM_MODULE} module"
	${RUN}cd ${WRKSRC} && ${CONFIGURE_LOGFILTER} 			\
		${SETENV} ${CONFIGURE_ENV} 				\
		${TOOLS.genom} ${GENOM_ARGS} ${GENOM_MODULE}
endif # GENOM_MODULE

endif # GENOM_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}


# GenoM modules use mkdep, pocolibs, pkg-config, autoconf and libtool. Depend
# on these at the global level so that the dependencies get registered as a
# primary dependency for the packages including this file.
#
include ../../devel/mkdep/depend.mk
include ../../devel/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
