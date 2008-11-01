#!/bin/sh

# $LAAS: prefixsearch.sh 2008/11/01 01:51:10 tho $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Fri Oct 17 2008
#

set -e          # exit on errors

: ${ECHO:=echo}
: ${TEST:=test}
: ${SED:=sed}
: ${AWK:=awk}
: ${PKG_ADMIN_CMD:=robotpkg_admin}

self="${0##*/}"

usage() {
        ${ECHO} 1>&2 "usage: $self [-p paths] pkg abi file [file ... ]"
}

# Process optional arguments
sysprefix="/usr /usr/local"
errors=no
while ${TEST} $# -gt 0; do
    case "$1" in
	-e)     errors=yes; shift ;;
	-p)     sysprefix="$2"; shift 2 ;;
        --)     shift; break ;;
        -*)     ${ECHO} 1>&2 "$self: unknown option -- ${1#-}"
                usage
                exit 1
                ;;
        *)      break ;;
    esac
done

if ${TEST} $errors = yes; then
    ERRMSG=${ECHO}
else
    ERRMSG=:
fi

# Process required arguments
${TEST} $# -gt 2 || { usage; exit 1; }
pkg="$1"; shift
abi="$1"; shift


# csh-like braces substitutions: replace a{x,y}b with axb ayb
bracesubst() {
    ${ECHO} "$*" | ${AWK} '
	/(^|[^\\\\]){/ { print brasub($0); next }
	{ print }

	function brasub(str,
			start, end, paren, alt, nalt, prefix, suffix,
			i, c, r, l) {
	    start = end = paren = 0
	    l = length(str)
	    for(i=1; i<=l; i++) {
		c = substr(str, i, 1)
		if (c == "\\\\") { i++; continue } # skip quoted chars

		if (c == "{")  {
		    if (++paren > 1) continue
		    start = end = i; nalt = 0; continue
		}

		if (paren < 1) continue
		if (paren > 1) {
		    if (c == "}") paren--
		    continue
		}

		if (c == "," || c == "}")  {
		    alt[nalt++] = substr(str, end+1, i-end-1)
		    end = i;
		    if (c == "}") break; else continue
		}
	    }
	    # if no correct braces were found, return the initial string
	    if (c != "}" || paren != 1) return str

	    prefix = substr(str, 1, start-1)
	    suffix = substr(str, end+1)

	    for(i=0; i<nalt-1; i++) {
		r = r brasub(prefix alt[i] suffix) " "
	    }
	    return r brasub(prefix alt[nalt-1] suffix)
	}
    '
}

# Search files
prefix=
vrepl='y/-/./;q'

for p in $sysprefix; do
    for fspec in "$@"; do
	${ECHO} "$fspec" | { IFS=: read f spec cmd

	    set `bracesubst $p/$f` # perform glob and {,} substitutions

	    # iterate over file specs and test existence
	    for match in "$@"; do
		if ! ${TEST} -r "$match"; then
		    ${ERRMSG} "missing:	$match"
		    match=; continue
		fi

		# check file version, if needed 
		if ${TEST} -z "$spec$cmd"; then
		    ${ERRMSG} "found:		$match"
		    break
		fi

		version=
		if ${TEST} -z "$cmd"; then
		    version=`${SED} -ne "${spec:-p}" < $match | ${SED} $vrepl`
		else
		    icmd=`${ECHO} $cmd | ${SED} -e 's@%@'$match'@g'`
		    version=`$icmd 2>&1 | ${SED} -ne "${spec:-p}" | ${SED} $vrepl ||:`
		fi
		: ${version:=unknown}
		if ${PKG_ADMIN_CMD} pmatch "$abi" "$pkg-$version"; then
		    ${ERRMSG} "found:		$match, version $version"
		    break
		fi

		${ERRMSG} "found:		$match, wrong version $version"
		match=;
	    done
	    if ${TEST} -z "$match"; then exit 2; fi
	} || continue 2;
    done

    # stop on first successful match
    prefix="$p"
    break
done

# Output result
if ${TEST} -z "$prefix"; then
    exit 2;
fi

${ECHO} $prefix
