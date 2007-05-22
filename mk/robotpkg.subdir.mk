#
# Copyright (c) 2006 LAAS/CNRS                        --  Thu Dec  7 2006
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
# From $NetBSD: bsd.pkg.subdir.mk,v 1.66 2007/05/09 23:33:52 joerg Exp $
# Derived from: FreeBSD Id: bsd.port.subdir.mk,v 1.19 1997/03/09 23:10:56 wosch Exp
# from: @(#)bsd.subdir.mk	5.9 (Berkeley) 2/1/91
#

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
#	README.html:
#		Creating README.html for package.
#
#	afterinstall, all, beforeinstall, build, checksum, clean,
#	configure, deinstall, depend, describe, extract, fetch, fetch-list,
#	install, package, readmes, realinstall, reinstall, tags,
#	mirror-distfiles, bulk-install, bulk-package, ${PKG_MISC_TARGETS}
#

# Pull in stuff from robotpkg.conf - need to check two places as this may be
# called from pkgsrc or from pkgsrc/category.
-include ${CURDIR}/mk/robotpkg.prefs.mk
-include ${CURDIR}/../mk/robotpkg.prefs.mk

.DEFAULT_GOAL:=all

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
	cd ${CURDIR}/$@; ${RECURSIVE_MAKE} ${MAKEFLAGS} all

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
		${RECURSIVE_MAKE} ${MAKEFLAGS} "_THISDIR_=${_THISDIR_}$${entry}/" \
			${@:realinstall=install} || true; \
	done

readme:
	@${RECURSIVE_MAKE} ${MAKEFLAGS} README.html

ifdef ROBOTPKGTOP
README=	templates/README.top
else
README=	../templates/README.category
endif

HTMLIFY=	${SED} -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g'

.PHONY .PRECIOUS: README.html
README.html:
	@> $@.tmp
ifdef ROBOTPKGTOP
	@for entry in ${SUBDIR}; do \
		${ECHO} '<TR><TD VALIGN=TOP><a href="'$${entry}/README.html'">'"`${ECHO} $${entry} | ${HTMLIFY}`"'</a>: <TD>' >> $@.tmp; \
		${ECHO} `cd $${entry} && ${RECURSIVE_MAKE} ${MAKEFLAGS} show-comment | ${HTMLIFY}` >> $@.tmp; \
	done
else
	@for entry in ${SUBDIR}; do \
		${ECHO} '<TR><TD VALIGN=TOP><a href="'$${entry}/README.html'">'"`cd $${entry}; ${RECURSIVE_MAKE} ${MAKEFLAGS} make-readme-html-help`" >> $@.tmp; \
	done
endif
	@${SORT} -t '>' +3 -4 $@.tmp > $@.tmp2
	@${AWK} '{ ++n } END { print n }' < $@.tmp2 > $@.tmp4
ifeq (yes,$(call exists,${CURDIR}/DESCR))
	@${HTMLIFY} ${CURDIR}/DESCR > $@.tmp3
else
	@> $@.tmp3
endif
	@${CAT} ${README} | \
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
		${ECHO_MSG} "===>  Creating README.html for ${_THISDIR_}$(notdir ${CURDIR})" ; \
		${MV} $@.tmp5 $@ ; \
	fi
	@${RM} -f $@.tmp $@.tmp2 $@.tmp3 $@.tmp4
$(foreach subdir,${SUBDIR},\
	@cd ${subdir} && ${RECURSIVE_MAKE} ${MAKEFLAGS} "_THISDIR_=${_THISDIR_}$(notdir ${CURDIR})/" readme \
)

show-comment:
	@if [ $(call quote,${COMMENT})"" ]; then			\
		${ECHO} $(call quote,${COMMENT});			\
	elif [ -f COMMENT ] ; then					\
		${CAT} COMMENT;						\
	else								\
		${ECHO} '(no description)';				\
	fi
