#
# Copyright (c) 2007,2009-2011,2013 LAAS/CNRS
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
# From $NetBSD: bsd.pkg.subdir.mk,v 1.66 2007/05/09 23:33:52 joerg Exp $
# From $FreeBSD: bsd.port.subdir.mk,v 1.19 1997/03/09 23:10:56 wosch Exp $
# From @(#)bsd.subdir.mk	5.9 (Berkeley) 2/1/91
#
#                                       Anthony Mallet on Tue May 22 2007

# The include file <robotpkg.subdir.mk> contains the default targets
# for building ports subdirectories.
#
# SUBDIR	A list of subdirectories that should be built as well.
#		Each of the targets will execute the same target in the
#		subdirectories.
#

.DEFAULT_GOAL:=all

# Include any preferences, if not already included, and common
# definitions. The file robotpkg.prefs.mk is protected against double
# inclusion.
#
# Need to check two places as this may be called from robotpkg/. or from
# robotpkg/category/.
#
include $(realpath mk/robotpkg.prefs.mk ../mk/robotpkg.prefs.mk)

$(call require,${ROBOTPKG_DIR}/mk/internal/utils.mk)

# Require confirmation for top-level targets that are likely to be a mistake
#
ifeq  (,$(filter confirm,${MAKECMDGOALS}))
  MAKECMDGOALS?= ${.DEFAULT_GOAL}
  all package extract configure build install depend:  toplevel-confirm
  reinstall deinstall update: toplevel-confirm

  .PHONY: toplevel-confirm
  toplevel-confirm:
	@${ERROR_MSG} ${hline};					\
	${ERROR_MSG} "robotpkg is a package collection. It provides"	\
		"many different,";					\
	${ERROR_MSG} "unrelated and sometimes incompatible packages.";	\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "$${bf}You probably want to 'make ${MAKECMDGOALS}'"\
		"for a specific package$${rm}, or a";			\
	${ERROR_MSG} "few selected packages only. In this case, simply"	\
		"run";							\
	${ERROR_MSG} "  cd <category>/<package> && ${MAKE}"		\
		"${MAKECMDGOALS}";					\
	${ERROR_MSG} "See ${ROBOTPKG_DIR}/README.txt for further"	\
		"reference.";						\
	${ERROR_MSG} "";						\
	${ERROR_MSG} "$${bf}If your intention is really to"		\
		"'make ${MAKECMDGOALS}' for all packages,$${rm}";	\
	${ERROR_MSG} "please confirm by running: ${MAKE}"		\
		"${MAKECMDGOALS} confirm";				\
	${ERROR_MSG} ${hline};						\
	${FALSE}
endif

# Supported top-level targets
#
__targets=\
	all fetch package extract configure build install clean		\
	distclean depend reinstall tags checksum makepatchsum makesum	\
	mirror-distfiles deinstall update clean-update show-var		\
	show-vars print-var print-vars print-summary-data lint headings

.PHONY: ${__targets}
${__targets}: recursive-subdir
${__targets}:; @: # prevents 'nothing to be done for...'

.PHONY:
recursive-subdir:
	${RUN}for entry in "" ${SUBDIR}; do				\
	  ${TEST} -n "$$entry" || continue;				\
	  ${PHASE_MSG} "Entering ${_THISDIR_}$${entry}";		\
	  cd ${CURDIR}/$${entry};					\
	  ${RECURSIVE_MAKE} "_THISDIR_=${_THISDIR_}$${entry}/"		\
	    ${filter ${__targets} confirm,${MAKECMDGOALS}};		\
	  ${PHASE_MSG} "Leaving ${_THISDIR_}$${entry}";			\
	done


${SUBDIR}::
	cd ${CURDIR}/$@; ${RECURSIVE_MAKE} all

# Informational show-% targets
.PHONY:
show-subdir:
	@$(foreach _,${SUBDIR},${ECHO} $(call quote,$_);)

.PHONY:
show-comment:
	@${ECHO} $(call quote,$(or ${COMMENT},(no description)))


# Packages sets
$(call require, ${ROBOTPKG_DIR}/mk/sets/sets-vars.mk)

# index.html generation code.
$(call require-for, index index-all, ${ROBOTPKG_DIR}/mk/internal/index.mk)

# Tell 'make' not to try to rebuild any Makefile by specifing a target with no
# dependencies and no commands.
#
$(sort ${MAKEFILE_LIST}):;
