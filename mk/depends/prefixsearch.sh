#!/bin/sh

# $LAAS: prefixsearch.sh 2008/10/21 16:11:44 mallet $
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

# Search files
prefix=

for p in $sysprefix; do
    for fspec in "$@"; do
	${ECHO} "$fspec" | { IFS=: read f spec cmd

	    set $p/$f # perform glob substitution
	    match=$1

	    # test file existence
	    if ! ${TEST} -r "$match"; then
		${ERRMSG} "missing:	$match"
		exit 2
	    fi

	    if ${TEST} -z "$spec$cmd"; then continue; fi

	    # check file version 
	    : ${spec:=p}
	    if ${TEST} -z "$cmd"; then
		version=`${SED} -ne "$spec" < $match | ${SED} -e q`
	    else
		cmd=`${ECHO} $cmd | ${SED} -e 's@%@'$match'@g'`
		version=`$cmd 2>&1 | ${SED} -ne "$spec" | ${SED} -e q || :`
	    fi
	    : ${version:=unknown}
	    ${PKG_ADMIN_CMD} pmatch "$abi" "$pkg-$version" || {
		${ERRMSG} "found:	$match, version $version"
		exit 2
	    }
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
