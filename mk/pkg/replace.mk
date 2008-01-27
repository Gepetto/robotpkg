# Copyright (c) 2008 IS/AIST-ST2I/CNRS
#      Joint Japanese-French Robotics Laboratory (JRL).
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
# From $NetBSD: replace.mk,v 1.23 2007/12/02 11:29:22 rillig Exp $
#

# --- pkg-replace ----------------------------------------------------
#
# Updates a package in-place on the system.
#
# See also:
#	replace
#
# XXX: The whole replacement, from deinstalling the old package up
# to installing the new package, should be one transaction. It
# currently isn't, and other packages can be confused when a +REQUIRED_BY
# files suddenly disappears.
#
_PKG_REPLACE_TARGETS+=	replace-names
_PKG_REPLACE_TARGETS+=	replace-preserve-installed-info
_PKG_REPLACE_TARGETS+=	replace-preserve-required-by
_PKG_REPLACE_TARGETS+=	deinstall
_PKG_REPLACE_TARGETS+=	reinstall
_PKG_REPLACE_TARGETS+=	replace-fixup-required-by
_PKG_REPLACE_TARGETS+=	replace-fixup-installed-info

.PHONY: pkg-replace
pkg-replace: ${_PKG_REPLACE_TARGETS}


# --------------------------------------------------------------------

_INSTALLED_INFO_FILE=	${WRKDIR}/.replace-+INSTALLED_INFO
_REQUIRED_BY_FILE=	${WRKDIR}/.replace-+REQUIRED_BY

_COOKIE.replace=	${WRKDIR}/.replace_done
_REPLACE_OLDNAME_FILE=	${WRKDIR}/.replace_oldname
_REPLACE_NEWNAME_FILE=	${WRKDIR}/.replace_newname

_REPLACE_OLDNAME_CMD=	\
	[ -f ${_REPLACE_OLDNAME_FILE} ] \
	|| ${FAIL_MSG} "[$@] ${_REPLACE_OLDNAME_FILE}: File not found"; \
	oldname=`${CAT} ${_REPLACE_OLDNAME_FILE}`

_REPLACE_NEWNAME_CMD=	\
	[ -f ${_REPLACE_NEWNAME_FILE} ] \
	|| ${FAIL_MSG} "[$@] ${_REPLACE_NEWNAME_FILE}: File not found"; \
	newname=`${CAT} ${_REPLACE_NEWNAME_FILE}`

# Computes and saves the full names of the installed package to be replaced
# (oldname) and the package that will be installed (newname), so that these
# names are available later.
.PHONY: replace-names
replace-names:
	${RUN} if [ x"${OLDNAME}" = x ]; then				\
		wildcard=$(call quote,${PKGWILDCARD});			\
	else								\
		wildcard="${OLDNAME}-[0-9]*";				\
	fi;								\
	${_PKG_BEST_EXISTS} "$${wildcard}" > ${_REPLACE_OLDNAME_FILE}
	${RUN} ${ECHO} ${PKGNAME} > ${_REPLACE_NEWNAME_FILE}
	${RUN} ${CP} -f ${_REPLACE_NEWNAME_FILE} ${_COOKIE.replace}

# Saves and removes the +INSTALLED_INFO file from the installed package.
.PHONY: replace-preserve-installed-info
replace-preserve-installed-info:
	@${STEP_MSG} "Preserving existing +INSTALLED_INFO file."
	${RUN} ${_REPLACE_OLDNAME_CMD};					\
	installed_info="${_PKG_DBDIR}/$$oldname/+INSTALLED_INFO";	\
	${TEST} ! -f "$$installed_info" ||				\
	${MV} $$installed_info ${_INSTALLED_INFO_FILE}

# Saves and removes the +REQUIRED_BY file from the installed package.
.PHONY: replace-preserve-required-by
replace-preserve-required-by:
	@${STEP_MSG} "Preserving existing +REQUIRED_BY file."
	${RUN} ${_REPLACE_OLDNAME_CMD};					\
	required_by="${_PKG_DBDIR}/$$oldname/+REQUIRED_BY";		\
	${TEST} ! -f "$$required_by" ||					\
	${MV} $$required_by ${_REQUIRED_BY_FILE}

# Fixes the +CONTENTS files of dependent packages to refer to the
# replacement package, and puts the +REQUIRED_BY file back into place.
# It also sets the unsafe_depends_strict tag on each dependent package,
# and sets the unsafe_depends tag if the replaced package has a different
# version.
#
# XXX Only set unsafe_depends if there is an ABI change.
#
.PHONY: replace-fixup-required-by
replace-fixup-required-by:
	@${STEP_MSG} "Fixing @pkgdep entries in dependent packages."
	${RUN} ${_REPLACE_OLDNAME_CMD};					\
	${_REPLACE_NEWNAME_CMD};					\
	${TEST} -f ${_REQUIRED_BY_FILE} || exit 0;			\
	${CAT} ${_REQUIRED_BY_FILE} |					\
	while read pkg; do						\
		case $$pkg in						\
		"")	continue ;;					\
		/*)	pkgdir="$$pkg" ;;				\
		*)	pkgdir="${_PKG_DBDIR}/$$pkg" ;;			\
		esac;							\
		contents="$$pkgdir/+CONTENTS";				\
		newcontents="$$contents.$$$$";				\
		${SETENV} OLDNAME="$$oldname" NEWNAME="$$newname"	\
		${AWK} '($$0 ~ "^@pkgdep " ENVIRON["OLDNAME"])		\
			{ print "@pkgdep " ENVIRON["NEWNAME"]; next }	\
			{ print }'					\
			$$contents > $$newcontents;			\
		${MV} -f $$newcontents $$contents;			\
		${PKG_ADMIN} set unsafe_depends_strict=YES $$pkg;	\
		if ${TEST} "$$oldname" != "$$newname"; then		\
			${PKG_ADMIN} set unsafe_depends=YES $$pkg;	\
		fi;							\
	done;								\
	${MV} ${_REQUIRED_BY_FILE} ${_PKG_DBDIR}/$$newname/+REQUIRED_BY

# Removes unsafe_depends* and rebuild tags from this package.
#
# XXX: pkg_admin should not complain on unset with no +INSTALLED_INFO.
#
.PHONY: replace-fixup-installed-info
replace-fixup-installed-info:
	@${STEP_MSG} "Removing unsafe_depends and rebuild tags."
	${RUN} ${_REPLACE_NEWNAME_CMD};					\
	[ ! -f ${_INSTALLED_INFO_FILE} ] ||			\
	${MV} ${_INSTALLED_INFO_FILE} ${_PKG_DBDIR}/$$newname/+INSTALLED_INFO; \
	for var in unsafe_depends unsafe_depends_strict rebuild; do	\
		${TEST} ! -f ${_PKG_DBDIR}/$$newname/+INSTALLED_INFO || \
		${PKG_ADMIN} unset $$var $$newname;			\
	done

# Removes the state files for the "replace" target, so that it may be re-invoked.
#
.PHONY: replace-clean
replace-clean:
	${RUN} ${_REPLACE_OLDNAME_CMD};					\
	${_REPLACE_NEWNAME_CMD};					\
	${RM} -f ${_REPLACE_OLDNAME_FILE} ${_REPLACE_NEWNAME_FILE}	\
		${_COOKIE.replace}
