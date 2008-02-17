#
# Copyright (c) 2008
#      IS/AIST-ST2I/CNRS Joint Japanese-French Robotics Laboratory (JRL).
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
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: bsd.options.mk,v 1.65 2007/10/28 11:29:06 tron Exp $
#
# This Makefile fragment provides boilerplate code for standard naming
# conventions for handling per-package build options.
#
# Before including this file, the following variables can be defined:
#
#	PKG_SUPPORTED_OPTIONS
#		This is a list of build options supported by the package.
#		This variable should be set in a package Makefile.  E.g.,
#
#		   PKG_SUPPORTED_OPTIONS=	ipv6 ssl
#
#		If this variable is not	defined, PKG_OPTIONS is set to
#		the empty list and the package is otherwise treated as
#		not using the options framework.
#
#	PKG_OPTIONS_VAR (must be defined)
#               The variable the user can set to enable or disable
#		options specifically for this package.
#
#	PKG_SUGGESTED_OPTIONS (defaults to empty)
#		This is a list of build options which are enabled by default.
#
#
# Optionally, the user may define the following variables in etc/robotpkg.conf:
#
#	PKG_DEFAULT_OPTIONS
#               This variable can be used to override default
#		options for every package.  Options listed in this
#		variable will be enabled in every package that
#		supports them.  If you prefix an option with `-',
#		it will be disabled in every package.
#
#	${PKG_OPTIONS_VAR}
#		This variable can be used to override default
#		options and options listed in PKG_DEFAULT_OPTIONS.
#		The syntax is the same as PKG_DEFAULT_OPTIONS.
#
# After including this file, the following variable is defined:
#
#	PKG_OPTIONS
#		This is the list of the selected build options, properly
#		filtered to remove unsupported and duplicate options.
#

ifndef PKG_OPTIONS_MK
PKG_OPTIONS_MK=		# defined

# To add options support to a package, here is an example for an
# options.mk file. This file should be included by the package Makefile
# or Makefile.common.
#
# -------------8<-------------8<-------------8<-------------8<-------------
# PKG_OPTIONS_VAR=		PKG_OPTIONS.wibble
# PKG_SUPPORTED_OPTIONS=	foo bar
# PKG_SUGGESTED_OPTIONS=	foo
#
# PKG_OPTION.foo=		Enable the foo option.
# PKG_OPTION.bar=		Build with the bar package.
#
# include ../../mk/robotpkg.options.mk
#
# # Package-specific option-handling
#
# ###
# ### FOO support
# ###
# ifneq (,$(findstring foo,$(PKG_OPTIONS)))
# CONFIGURE_ARGS+=	--enable-foo
# endif
#
# ###
# ### BAR support
# ###
# ifneq (,$(findstring bar,$(PKG_OPTIONS)))
# DEPENDS+=		bar>=1.0:../../wibble/bar
# CONFIGURE_ARGS+=	--enable-bar=${PREFIX}
# endif
# -------------8<-------------8<-------------8<-------------8<-------------
#

# include the preference file
ifndef _PKGSRC_TOPDIR
_PKGSRC_TOPDIR=$(shell \
	if test -f ../../mk/robotpkg.mk; then	\
		echo `pwd`/../..;		\
	elif test -f ../mk/robotpkg.mk; then	\
		echo `pwd`/..;			\
	elif test -f ./mk/robotpkg.mk; then	\
		echo `pwd`;			\
	fi)
endif
include ${_PKGSRC_TOPDIR}/mk/robotpkg.prefs.mk


# Check for variable definitions required before including this file.
ifndef PKG_OPTIONS_VAR
PKG_FAIL_REASON+=       "[robotpkg.options.mk] PKG_OPTIONS_VAR is not defined."
endif
ifndef PKG_SUPPORTED_OPTIONS
PKG_FAIL_REASON+=       "[robotpkg.options.mk] The package has no options, but includes this file."
endif

#
# filter unsupported options from PKG_DEFAULT_OPTIONS
#
_OPTIONS_DEFAULT_SUPPORTED:=# empty
define default_options
_opt_:=		${1}
_popt_:=	$(patsubst -%,%,${1})
ifneq (,$$(findstring $${_popt_},$(PKG_SUPPORTED_OPTIONS)))
_OPTIONS_DEFAULT_SUPPORTED:=$${_OPTIONS_DEFAULT_SUPPORTED} $${_opt_}
endif
endef
$(foreach _o_,${PKG_DEFAULT_OPTIONS},$(eval $(call default_options,${_o_})))


#
# process options from generic to specific
#

PKG_OPTIONS:=# empty
_OPTIONS_UNSUPPORTED:=# empty
define build_options
_opt_:=		${1}
_popt_:=	$(patsubst -%,%,${1})
ifeq (,$$(findstring $${_popt_},$${PKG_SUPPORTED_OPTIONS}))
_OPTIONS_UNSUPPORTED:=$${_OPTIONS_UNSUPPORTED} $${_opt_}
else
 ifneq ($${_opt_},$${_popt_})
PKG_OPTIONS:=	$$(filter-out $${_popt_},$${PKG_OPTIONS})
 else
PKG_OPTIONS:=	$${PKG_OPTIONS} $${_popt_}
 endif
endif
endef
$(foreach _o_,	${PKG_SUGGESTED_OPTIONS}	\
		${_OPTIONS_DEFAULT_SUPPORTED}	\
		${${PKG_OPTIONS_VAR}},$(eval $(call build_options,${_o_})))

ifneq (,$(strip $(_OPTIONS_UNSUPPORTED)))
PKG_FAIL_REASON+=	"[robotpkg.options.mk] The following selected options are not supported:"
PKG_FAIL_REASON+=	"	"$(call quote,$(sort ${_OPTIONS_UNSUPPORTED}))"."
endif

PKG_OPTIONS:=	$(sort ${PKG_OPTIONS})

# Store the result in the +BUILD_INFO file so we can query for the build
# options using "robotpkg_info -Q PKG_OPTIONS <pkg>".
BUILD_DEFS+=            PKG_OPTIONS

.PHONY: show-options
show-options:
ifdef PKG_SUPPORTED_OPTIONS
	@${ECHO} Any of the following general options may be selected:
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _opt_,$(sort ${PKG_SUPPORTED_OPTIONS}),			\
	${ECHO} "	"$(call quote,${_opt_})"	"${PKG_OPTION.${_opt_}};\
)
	@${ECHO}
	@${ECHO} "These options are enabled by default:"
ifneq (,$(strip ${PKG_SUGGESTED_OPTIONS}))
	@${ECHO} $(call quote,$(sort ${PKG_SUGGESTED_OPTIONS})) | ${wordwrapfilter}
else
	@${ECHO} "	(none)"
endif
	@${ECHO} ""
	@${ECHO} "These options are currently enabled:"
ifneq (,$(strip ${PKG_OPTIONS}))
	@${ECHO} $(call quote,$(sort ${PKG_OPTIONS})) | ${wordwrapfilter}
else
	@${ECHO} "	(none)"
endif
	@${ECHO} ""
	@${ECHO} "You can select which build options to use by setting PKG_DEFAULT_OPTIONS"
	@${ECHO} "or "$(call quote,${PKG_OPTIONS_VAR})" in "${_MAKECONF}"."
else
	@${ECHO} This package does not use the options framework.	
endif

ifdef PKG_SUPPORTED_OPTIONS
.PHONY: supported-options-message
pre-depends-hook: supported-options-message
supported-options-message:
	@${ECHO} "=========================================================================="
	@${ECHO} "The supported build options for ${PKGBASE} are:"
	@${ECHO} ""
	@${ECHO} $(call quote,$(sort ${PKG_SUPPORTED_OPTIONS})) | ${wordwrapfilter}
	@${ECHO} ""
	@${ECHO} "The currently selected options are:"
	@${ECHO} ""
ifneq (,$(strip ${PKG_OPTIONS}))
	@${ECHO} $(call quote,$(sort ${PKG_OPTIONS})) | ${wordwrapfilter}
else
	@${ECHO} "	(none)"
endif
	@${ECHO} ""
	@${ECHO} "You can select which build options to use by setting PKG_DEFAULT_OPTIONS"
	@${ECHO} "or the following variable.  Its current value is shown:"
	@${ECHO} ""
ifdef ${PKG_OPTIONS_VAR}
	@${ECHO} "	${PKG_OPTIONS_VAR} = "$(call quote,${${PKG_OPTIONS_VAR}})
else
	@${ECHO} "	${PKG_OPTIONS_VAR} = (undefined)"
endif
	@${ECHO} ""
	@${ECHO} "You may want to abort the process now with CTRL-C and change its value"
	@${ECHO} "before continuing.  Be sure to run \`${MAKE} clean' after"
	@${ECHO} "the changes."
	@${ECHO} "=========================================================================="
endif

endif	# PKG_OPTIONS_MK
