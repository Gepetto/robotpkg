# $LAAS: robotpkg.subdir.mk 2009/03/05 00:10:40 tho $
#
# Copyright (c) 2007,2009 LAAS/CNRS
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
#
# +++ variables +++
#
# OPSYS		Get the operating system type [`uname -s`]
#
# SUBDIR	A list of subdirectories that should be built as well.
#		Each of the targets will execute the same target in the
#		subdirectories.
#
#
# +++ targets +++
#
#	index.html:
#		Creating index.html for package.
#
#	afterinstall, all, beforeinstall, build, checksum, clean,
#	configure, deinstall, depend, describe, extract, fetch, fetch-list,
#	install, package, readmes, realinstall, reinstall, tags,
#	mirror-distfiles, bulk-install, bulk-package, ${PKG_MISC_TARGETS}
#

.DEFAULT_GOAL:=all

# Include any preferences, if not already included, and common
# definitions. The file robotpkg.prefs.mk is protected against double
# inclusion, but checking the flag here avoids loading and parsing it.
#
# Need to check two places as this may be called from pkgsrc or from
# pkgsrc/category.
#
include $(realpath mk/robotpkg.prefs.mk ../mk/robotpkg.prefs.mk)

$(call require,${ROBOTPKG_DIR}/mk/internal/utils.mk)
ifeq (0,${_ROBOTPKG_DEPTH})
  $(call require,${ROBOTPKG_DIR}/mk/internal/toplevel.mk)
endif

# Supported top-level targets
#
__targets=\
	all fetch package extract configure build install clean		\
	cleandir distclean depend describe reinstall tags checksum	\
	makedistinfo makepatchsum makesum mirror-distfiles deinstall	\
	update clean-update show-var show-vars lint

.PHONY: ${__targets}
${__targets}: %: %-subdir

%-subdir: .FORCE interactive
	@for entry in "" ${SUBDIR}; do					\
		if [ "X$$entry" = "X" ]; then continue; fi; 		\
		cd ${CURDIR}/$${entry};					\
		${PHASE_MSG} "${_THISDIR_}$${entry}";			\
		${RECURSIVE_MAKE} "_THISDIR_=${_THISDIR_}$${entry}/" 	\
			${*:realinstall=install} || ${TRUE}; 		\
	done


${SUBDIR}::
	cd ${CURDIR}/$@; ${RECURSIVE_MAKE} all

$(call require,${ROBOTPKG_DIR}/mk/internal/index.mk)
