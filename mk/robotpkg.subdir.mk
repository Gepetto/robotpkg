# $LAAS: robotpkg.subdir.mk 2009/01/19 23:41:46 tho $
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
# Derived from: FreeBSD Id: bsd.port.subdir.mk,v 1.19 1997/03/09 23:10:56 wosch Exp
# from: @(#)bsd.subdir.mk	5.9 (Berkeley) 2/1/91
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
all:

# Pull in stuff from robotpkg.conf - need to check two places as this may be
# called from pkgsrc or from pkgsrc/category.
ifdef ROBOTPKGTOP
 include ${CURDIR}/mk/robotpkg.prefs.mk
 include ${CURDIR}/mk/internal/toplevel.mk
else
 include ${CURDIR}/../mk/robotpkg.prefs.mk
endif

AWK?=		/usr/bin/awk
CAT?=		/bin/cat
BASENAME?=	/usr/bin/basename
ECHO?=		echo
ECHO_MSG?=	${ECHO}
MV?=		/bin/mv
RM?=		/bin/rm
SED?=		/usr/bin/sed
SORT?=		/usr/bin/sort

${SUBDIR}::
	cd ${CURDIR}/$@; ${RECURSIVE_MAKE} all

__targets=\
	all fetch package extract configure build install clean \
	cleandir distclean depend describe reinstall tags checksum \
	makedistinfo makepatchsum makesum mirror-distfiles deinstall \
	show-downlevel show-pkgsrc-dir show-var show-vars \
	bulk-install bulk-package fetch-list-one-pkg \
	fetch-list-recursive update clean-update lint \
	check-vulnerable pbulk-index \
	${PKG_MISC_TARGETS}

.PHONY: ${__targets}
${__targets}:
	@for entry in "" ${SUBDIR}; do \
		if [ "X$$entry" = "X" ]; then continue; fi; \
		cd ${CURDIR}/$${entry}; \
		${ECHO_MSG} "===> ${_THISDIR_}$${entry}"; \
		${RECURSIVE_MAKE} "_THISDIR_=${_THISDIR_}$${entry}/" \
			${@:realinstall=install} || true; \
	done

index:
	@${RECURSIVE_MAKE} index.html

ifdef ROBOTPKGTOP
INDEX=	mk/templates/index.top
else
INDEX=	../mk/templates/index.category
endif

HTMLIFY=	${SED} -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g'

.PHONY .PRECIOUS: index.html
index.html:
	@> $@.tmp
ifdef ROBOTPKGTOP
	@for entry in ${SUBDIR}; do \
		${ECHO_N} '<TR><TD VALIGN=TOP><a href="'$${entry}/index.html'">'"`${ECHO} $${entry} | ${HTMLIFY}`"'</a>: <TD>' >> $@.tmp; \
		${ECHO} `cd $${entry} && ${RECURSIVE_MAKE} show-comment | ${HTMLIFY}` >> $@.tmp; \
	done
else
	@for entry in ${SUBDIR}; do \
		${ECHO} '<TR><TD VALIGN=TOP><a href="'$${entry}/index.html'">'"`cd $${entry}; ${RECURSIVE_MAKE} make-index-html-help`" >> $@.tmp; \
	done
endif
	@${SORT} -t '>' -k 3,4 $@.tmp > $@.tmp2
	@${AWK} '{ ++n } END { print n }' < $@.tmp2 > $@.tmp4
ifeq (yes,$(call exists,${CURDIR}/DESCR))
	@${HTMLIFY} ${CURDIR}/DESCR > $@.tmp3
else
	@> $@.tmp3
endif
	@${CAT} ${INDEX} | \
		${SED} -e 's/%%CATEGORY%%/'"`${BASENAME} ${CURDIR}`"'/g' \
			-e '/%%NUMITEMS%%/r$@.tmp4' \
			-e '/%%NUMITEMS%%/d' \
			-e '/%%DESCR%%/r$@.tmp3' \
			-e '/%%DESCR%%/d' \
			-e '/%%SUBDIR%%/r$@.tmp2' \
			-e '/%%SUBDIR%%/d' \
		> $@.tmp5
	@if [ -f $@ ] && ${CMP} -s $@.tmp5 $@ ; then \
		${RM} $@.tmp5 ; \
	else \
		${ECHO_MSG} "===>  Creating index.html for ${_THISDIR_}$(notdir ${CURDIR})" ; \
		${MV} $@.tmp5 $@ ; \
	fi
	@${RM} -f $@.tmp $@.tmp2 $@.tmp3 $@.tmp4
	@for subdir in ${SUBDIR} ""; do \
		if [ "X$$subdir" = "X" ]; then continue; fi; \
		(cd $${subdir} && ${RECURSIVE_MAKE} "_THISDIR_=${_THISDIR_}$(notdir ${CURDIR})/" index); \
	done

show-comment:
	@if [ $(call quote,${COMMENT})"" ]; then			\
		${ECHO} $(call quote,${COMMENT});			\
	elif [ -f COMMENT ] ; then					\
		${CAT} COMMENT;						\
	else								\
		${ECHO} '(no description)';				\
	fi
