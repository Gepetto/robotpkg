# $LAAS: robotpkg.options.mk 2009/11/17 17:40:21 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
# From $NetBSD: bsd.options.mk,v 1.65 2007/10/28 11:29:06 tron Exp $
#
#                                       Anthony Mallet on Sun Jan 27 2008
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
#	PKG_OPTION_DESCR.<opt>
#		This is the textual description of the option <opt> which
#		is displayed by the make 'show-options' target. E.g.,
#
#		   PKG_OPTION_DESCR.bar=	Enable the bar option.
#
#	PKG_OPTION_SET.<opt> (resp. PKG_OPTION_UNSET.<opt>)
#		This is a makefile fragment that is evaluated when the
#		option <opt> is set (resp unset) for the package. E.g.,
#
#		   PKG_OPTION_SET.bar=		CFLAGS+=-DBAR
#		   PKG_OPTION_UNSET.bar=	CFLAGS+=-DNO_BAR
#
#	PKG_OPTIONS_OPTIONAL_GROUPS
#		This is a list of names of groups of mutually exclusive
#		options.  The options in each group are listed in
#		PKG_OPTIONS_GROUP.<groupname>.  The most specific
#		setting of any option from the group takes precedence
#		over all other options in the group.  Options from
#		the groups will be automatically added to
#		PKG_SUPPORTED_OPTIONS.
#
#	PKG_OPTIONS_REQUIRED_GROUPS
#		Like PKG_OPTIONS_OPTIONAL_GROUPS, but building
#		the packages will fail if no option from the group
#		is selected.
#
#	PKG_OPTIONS_NONEMPTY_SETS
#	       This is a list of names of sets of options.  At
#	       least one option from each set must be selected.
#	       The options in each set are listed in
#	       PKG_OPTIONS_SET.<setname>.  Options from the sets
#	       will be automatically added to PKG_SUPPORTED_OPTIONS.
#
#	PKG_OPTIONS_VAR
#		The variable the user can set to enable or disable
#		options specifically for this package. Defaults to
#		PKG_OPTIONS.${PKGBASE}
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

#
# To add options support to a package, here is an example Makefile
# fragment for a 'wibble' package. This fragment should be included in
# the 'wibble' package Makefile or its depend.mk file if the options are
# meaningful for the packages that depend on it.
#
# -------------8<-------------8<-------------8<-------------8<-------------
# PKG_OPTIONS_VAR=		PKG_OPTIONS.wibble
# PKG_SUPPORTED_OPTIONS=	foo bar
# PKG_OPTIONS_OPTIONAL_GROUPS=	robot
# PKG_OPTIONS_GROUP.robot=	lama hrp2
# PKG_SUGGESTED_OPTIONS=	foo
#
# PKG_OPTION_DESCR.foo=		Enable the foo option.
# PKG_OPTION_DESCR.bar=		Build with the bar package.
# PKG_OPTION_DESCR.lama=	Build for the lama robot.
# PKG_OPTION_DESCR.hrp2=	Build for the hrp2 robot.
#
# define PKG_OPTION_SET.bar
#  CFLAGS+=-DNO_BAR
#  include ../../pkg/bar/depend.mk
# endef
# PKG_OPTION_UNSET.bar=		CFLAGS+=-DNO_BAR
#
# -------------8<-------------8<-------------8<-------------8<-------------
#

# Define options common to all packages
#
ifndef NO_BUILD
  ifneq (,$(strip ${USE_LANGUAGES}))
    # option is defined here, but the _SET and UNSET scripts are defined by
    # the compilers themselves, in gcc.mk
    #
    PKG_SUPPORTED_OPTIONS+=	debug
    PKG_OPTION_DESCR.debug:=	Produce debugging information for binary programs

    define PKG_OPTION_SET.debug
      CFLAGS+=		${_CFLAGS_DEBUG}
      CXXFLAGS+=	${_CFLAGS_DEBUG}
    endef
    define PKG_OPTION_UNSET.debug
      CFLAGS+=		${_CFLAGS_NDEBUG}
      CXXFLAGS+=	${_CFLAGS_NDEBUG}
    endef
  endif
endif


# Remember the general options for `show-options' target
#
PKG_GENERAL_OPTIONS:=	${PKG_SUPPORTED_OPTIONS}


# Create map of option to group and add group options to PKG_SUPPORTED_OPTIONS
#
define _pkgopt_mapgrp
  _PKG_OPTIONS_GROUP_STACK.${1}:=#empty
  ifeq (,$(strip ${PKG_OPTIONS_GROUP.${1}}))
    PKG_FAIL_REASON+=	"PKG_OPTIONS_GROUP.${1} must be non-empty."
  endif
  PKG_SUPPORTED_OPTIONS+=${PKG_OPTIONS_GROUP.${1}}
  $$(foreach _o_,${PKG_OPTIONS_GROUP.${1}},\
	$$(eval _PKG_OPTIONS_GROUP_MAP.$${_o_}=${1}))
endef
$(foreach _o_,\
	${PKG_OPTIONS_OPTIONAL_GROUPS} ${PKG_OPTIONS_REQUIRED_GROUPS},\
	$(eval $(call _pkgopt_mapgrp,${_o_})))


# Add options from sets to PKG_SUPPORTED_OPTIONS
#
_PKG_OPTIONS_ALL_SETS:=#empty
override define _pkgopt_addset
  ifeq (,$(strip ${PKG_OPTIONS_SET.${1}}))
    PKG_FAIL_REASON+=	"PKG_OPTIONS_SET.${1} must be non-empty."
  endif
  PKG_SUPPORTED_OPTIONS+=${PKG_OPTIONS_SET.${1}}
  _PKG_OPTIONS_ALL_SETS+=${PKG_OPTIONS_SET.${1}}
endef
$(foreach _s_,\
	${PKG_OPTIONS_NONEMPTY_SETS}, $(eval $(call _pkgopt_addset,${_s_})))


# Don't parse this file if the package doesn't have options
#
ifdef PKG_SUPPORTED_OPTIONS


# Set the default name of the PKG_OPTIONS_VAR
#
PKG_OPTIONS_VAR?=	PKG_OPTIONS.${PKGBASE}


# Filter out unsupported options from PKG_DEFAULT_OPTIONS.
#
_OPTIONS_DEFAULT_SUPPORTED:=# empty
define _pkgopt_supported
  _opt_:=	${1}
  _popt_:=	$(patsubst -%,%,${1})#	positive option
  ifneq (,$$(findstring $${_popt_},$(PKG_SUPPORTED_OPTIONS)))
    _OPTIONS_DEFAULT_SUPPORTED:=$${_OPTIONS_DEFAULT_SUPPORTED} $${_opt_}
  endif
endef
$(foreach _o_,${PKG_DEFAULT_OPTIONS},$(eval $(call _pkgopt_supported,${_o_})))


# Process options from generic to specific and store the final result in
# PKG_OPTIONS.
#
PKG_OPTIONS:=#		empty
_OPTIONS_UNSUPPORTED:=#	empty
define _pkgopt_process
  _opt_:=	${1}
  _popt_:=	$(patsubst -%,%,${1})#	positive option

  ifeq (,$$(findstring $${_popt_},${PKG_SUPPORTED_OPTIONS}))
    _OPTIONS_UNSUPPORTED:=$${_OPTIONS_UNSUPPORTED} $${_opt_}
  else
    ifdef _PKG_OPTIONS_GROUP_MAP.$${_popt_}
      _grp_:= $${_PKG_OPTIONS_GROUP_MAP.$${_popt_}}
      _stk_:= _PKG_OPTIONS_GROUP_STACK.$${_grp_}
    else
      _stk_:= PKG_OPTIONS
    endif
    _cnt_:= $${$${_stk_}}
    ifneq ($${_opt_},$${_popt_})
      $${_stk_}:= $$(filter-out $${_popt_},$${_cnt_})
    else
      $${_stk_}:= $${_cnt_} $${_popt_}
    endif
  endif
endef
$(foreach _o_,${PKG_SUGGESTED_OPTIONS} ${_OPTIONS_DEFAULT_SUPPORTED}	\
	${${PKG_OPTIONS_VAR}}, $(eval $(call _pkgopt_process,${_o_})))


# Fail if required groups are not set
#
define _pkgopt_chkreqd
  ifeq (,$(strip ${_PKG_OPTIONS_GROUP_STACK.${1}}))
    ifneq (,$${PKG_FAIL_REASON})
      PKG_FAIL_REASON+=""
    endif
    PKG_FAIL_REASON+=	${hline}
    PKG_FAIL_REASON+=	"One of the following build options must be selected: "
    PKG_FAIL_REASON+=	"	"$(call quote,${PKG_OPTIONS_GROUP.${1}})
    PKG_OPTIONS_FAILED=	yes
  endif
endef
$(foreach _g_,${PKG_OPTIONS_REQUIRED_GROUPS},\
	$(eval $(call _pkgopt_chkreqd,${_g_})))


# Add selected groups options to PKG_OPTIONS
#
define _pkgopt_addgrps
  ifneq (,$(strip ${_PKG_OPTIONS_GROUP_STACK.${1}}))
    PKG_OPTIONS:= ${PKG_OPTIONS} $(lastword ${_PKG_OPTIONS_GROUP_STACK.${1}})
  endif
endef
$(foreach _g_,\
	${PKG_OPTIONS_REQUIRED_GROUPS}\
	${PKG_OPTIONS_OPTIONAL_GROUPS},\
	$(eval $(call _pkgopt_addgrps,${_g_})))


# Fail if a set is empty
#
override define _pkgopt_chkset
  ifeq (,$(filter ${PKG_OPTIONS_SET.${1}},${PKG_OPTIONS}))
    ifneq (,$${PKG_FAIL_REASON})
      PKG_FAIL_REASON+=""
    endif
    PKG_FAIL_REASON+=	${hline}
    PKG_FAIL_REASON+=	"At least one of the following build options must be selected: "
    PKG_FAIL_REASON+=	"	"$(call quote,${PKG_OPTIONS_SET.${1}})
    PKG_OPTIONS_FAILED=	yes
  endif
endef
$(foreach _s_,\
	${PKG_OPTIONS_NONEMPTY_SETS},$(eval $(call _pkgopt_chkset,${_s_})))


# Bail out if there remain some unspported options.
#
ifneq (,$(strip $(_OPTIONS_UNSUPPORTED)))
  ifneq (,$${PKG_FAIL_REASON})
    PKG_FAIL_REASON+=""
  endif
  PKG_FAIL_REASON+=	"The following selected options are not supported:"
  PKG_FAIL_REASON+=	"	"$(call quote,$(sort ${_OPTIONS_UNSUPPORTED}))
  PKG_OPTIONS_FAILED=	yes
endif


# In case of error, mention some help
#
ifdef PKG_OPTIONS_FAILED
  PKG_FAIL_REASON+=	""
  PKG_FAIL_REASON+=	"See \`${MAKE} show-options' for details."
  PKG_FAIL_REASON+=	${hline}
endif

# Store the result in the +BUILD_INFO file so we can query for the build
# options using "robotpkg_info -Q PKG_OPTIONS <pkg>".
#
PKG_OPTIONS:=		$(sort ${PKG_OPTIONS})
BUILD_DEFS+=            PKG_OPTIONS

# Provide PLIST.<opt> substitutions
#
$(foreach _o_,${PKG_SUPPORTED_OPTIONS},					\
  $(eval $(if $(filter ${_o_},${PKG_OPTIONS}),				\
    PLIST.${_o_}=,PLIST.${_o_}=@comment )))
PLIST_VARS+=${PKG_SUPPORTED_OPTIONS}

# Execute the PKG_OPTION_SET/UNSET scripts.
#
$(foreach _o_,${PKG_SUPPORTED_OPTIONS},					\
  $(eval $(if $(filter ${_o_},${PKG_OPTIONS}),				\
    $(value PKG_OPTION_SET.${_o_}),$(value PKG_OPTION_UNSET.${_o_}))))


# --- show-options ---------------------------------------------------
#
# print the list of available options for this package.
#
define _pkgopt_listopt
  $(foreach o,${1},\
    ${ECHO} "	"$(call quote,${o})"	"$(call quote,${PKG_OPTION_DESCR.${o}});\
  )
endef

.PHONY: show-options
show-options:
ifneq (,$(strip ${PKG_GENERAL_OPTIONS}))
	@${ECHO} "Any of the following general options may be selected:"
	${RUN}$(foreach _o_, $(sort ${PKG_GENERAL_OPTIONS}),		\
	  $(call _pkgopt_listopt,${_o_}))
endif
	${RUN}$(foreach _g_, ${PKG_OPTIONS_REQUIRED_GROUPS},		\
	  ${ECHO} "Exactly one of the following ${_g_} options is required:";\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_GROUP.${_g_}}))
	${RUN}$(foreach _g_, ${PKG_OPTIONS_OPTIONAL_GROUPS},		\
	  ${ECHO} "At most one of the following ${_g_} options may be selected:";\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_GROUP.${_g_}}))
	${RUN}$(foreach _s_, ${PKG_OPTIONS_NONEMPTY_SETS},		\
	  ${ECHO} "At least one of the following ${_s_} options must be selected:";\
	  $(call _pkgopt_listopt,${PKG_OPTIONS_SET.${_s_}}))
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
	@${ECHO} "You can select which build options to use by"		\
		"setting PKG_DEFAULT_OPTIONS or "			\
		$(call quote,${PKG_OPTIONS_VAR})" to the list of"	\
		"desired options. Options prefixed with a dash (-)"	\
		"will be disabled. The variables are to be set in"	\
		${MAKECONF}"." | fmt


# --- supported-options-message --------------------------------------
#
# print an informative message that lists the available options for this
# package.
#
pre-depends-hook: supported-options-message

.PHONY: supported-options-message
supported-options-message:
	@${ECHO_MSG} ${hline};						\
	${ECHO}	"The supported build options for ${PKGBASE} are:";	\
	${ECHO} "";							\
	$(foreach _o_,							\
		$(sort ${PKG_SUPPORTED_OPTIONS}),			\
		$(call _pkgopt_listopt,${_o_}))				\
	${ECHO} "";							\
$(if $(strip ${PKG_OPTIONS}),						\
	${ECHO} "Building with the following options enabled:";		\
	${ECHO} "";							\
	$(foreach _o_,							\
		$(sort ${PKG_OPTIONS}),					\
		$(call _pkgopt_listopt,${_o_}))				\
	${ECHO} "";							\
)									\
	${ECHO} "You may want to abort the process now with CTRL-C"	\
		"and review the";					\
	${ECHO} "available build options with \`${MAKE} show-options'"	\
		"before";						\
	${ECHO} "continuing. Be sure to run \`${MAKE} clean' after any"	\
		"change.";						\
	${ECHO_MSG} ${hline}

else	# !PKG_SUPPORTED_OPTIONS

.PHONY: show-options
show-options:
	@${ECHO} "This package does not use the options framework."

endif	# PKG_SUPPORTED_OPTIONS
