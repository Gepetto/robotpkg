#!/bin/sh
#
# Copyright (c) 2008-2011 LAAS/CNRS
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

# --------------------------------------------------------------------------
#
# NAME
#	prefixsearch.sh -- search for system packages and their prefix
#
# SYNOPSIS
#	prefixsearch.sh -- [options] pkg abi file ...
#
# DESCRIPTION
#	prefixsearch.sh takes a package name, an ABI requirement and a list
#	of file specifications that belong to the package. Each file
#	specification may be a simple file name which is only tested for
#	existence or a string in the form 'file:sed:prog' which tests the
#	existence and the version of the file. If the file exists, 'prog' is
#	executed with its standard output is passed to the 'sed' program which
#	is expected to return the version of the file. 'prog' might contain a %
#	character which is replaced by the actual path of the file begin
#	tested.
#
#	prefixsearch.sh exists with a non-zero status if the package could
#	not be found.
#
# OPTIONS
#	The following command line arguments are supported.
#
#	-v	Print the result of the search on standard output.
#
#	-e	Display a verbose error message if the package is not found.
#
#	-p path
#		Add the 'path' directory to the list of search paths. Multiple
#		options may be specified.
#
# ENVIRONMENT
#	PKG_ADMIN_CMD
#		Contains the command to execute robotpkg_admin.
#
# --------------------------------------------------------------------------

set -e          # exit on errors

: ${ECHO:=echo}
: ${TEST:=test}
: ${SED:=sed}
: ${AWK:=awk}
: ${PKG_ADMIN_CMD:=robotpkg_admin}

: ${ERROR_MSG:=${ECHO}}

: ${SYSLIBSUFFIX:=}

self="${0##*/}"

usage() {
        ${ECHO} 1>&2 "usage: $self [-p paths] pkg abi file [file ... ]"
}

# Process optional arguments
sysprefix=
verbose=no
errors=no
while ${TEST} $# -gt 0; do
    case "$1" in
	-v)     verbose=yes; shift ;;
	-e)     errors=yes; shift ;;
	-p)     sysprefix="$sysprefix ${2%/}"; shift 2 ;;

	-d)     pkgdesc="$2"; shift 2 ;;
	-s)     syspkg="$2"; shift 2 ;;
	-o)     sys="$2"; shift 2 ;;
	-r)     robotpkg="$2"; shift 2 ;;
	-t)     type="$2"; shift 2 ;;

        --)     shift; break ;;
        -*)     ${ECHO} 1>&2 "$self: unknown option -- ${1#-}"
                usage
                exit 1
                ;;
        *)      break ;;
    esac
done

if ${TEST} $verbose = yes; then
    MSG=${ECHO}
else
    MSG=:
fi

if ${TEST} -z "$sysprefix"; then
    sysprefix="/usr /usr/local"
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
pkgversion=
vrepl='y/-/./;q'

for p in `bracesubst $sysprefix`; do
    ${MSG} "searching in $p"
    flist=
    for fspec in "$@"; do
	# split file specification into `:' separated fields
	IFS=: read -r f spec cmd <<-EOF
		$fspec
	EOF

	# perform SYSLIBSUFFIX substitution: if a file spec starts with lib/
	# and a directory $p/lib${SYSLIBSUFFIX} exists, the lib/ in file spec
	# is changed to lib${SYSLIBSUFFIX}/.
	if ${TEST} "${f#lib/}" != "$f"; then
	    if ${TEST} -d "$p/lib${SYSLIBSUFFIX}"; then
		f="lib${SYSLIBSUFFIX}/${f#lib/}"
	    fi
	fi

	# iterate over file specs after glob and {,} substitutions and
	# test existence
	for match in `bracesubst $p/$f`; do
	    if ! ${TEST} -e "$match"; then
                # special case: make /usr optional in /usr/{bin,lib}
		if ${TEST} -z "${match##/usr/bin/*}"; then
		    alt="/bin/${match##/usr/bin/}"
		elif ${TEST} -z "${match##/usr/lib/*}"; then
		    alt="/lib/${match##/usr/lib/}"
		elif ${TEST} -z "${match##/usr/lib${SYSLIBSUFFIX}/*}"; then
		    alt="/lib${SYSLIBSUFFIX}/${match##/usr/lib${SYSLIBSUFFIX}/}"
		else
		    match=; continue
		fi
		match=
		for alt in $alt; do
		    if ${TEST} -r "${alt}"; then
			match=$alt; break
		    fi
		done
		if ${TEST} -z "$match"; then continue; fi
	    fi

	    # check file version, if needed
	    if ${TEST} -z "$spec$cmd"; then
		flist="$flist $match"
		${MSG} "found:	$match"
		break
	    fi

	    version=
	    if ${TEST} -z "$cmd"; then
		version=`${SED} -ne "${spec:-p}" < $match | ${SED} $vrepl`
	    else
		icmd=`${ECHO} $cmd | ${SED} -e 's@%@'$match'@g'`
		version=`eval $icmd 2>&1 </dev/null | ${SED} -ne "${spec:-p}" | ${SED} $vrepl ||:`
	    fi
	    : ${version:=unknown}
	    if ${PKG_ADMIN_CMD} pmatch "$abi" "$pkg-$version"; then
		pkgversion=-$version
		flist="$flist $match"
		${MSG} "found:	$match, version $version"
		break
	    fi

	    ${MSG} "found:	$match, wrong version $version"
	    match=;
	done
	if ${TEST} -z "$match"; then
	    for match in `bracesubst $p/$f`; do
		${MSG} "missing:	$match"
	    done
	    continue 2;
	fi
    done

    # stop on first successful match
    prefix="$p"
    break
done

# exit successfully if a match was found
if ${TEST} -n "$prefix"; then
    # warn if an abi requirement is present but no version could be found
    if ${TEST} -z "$pkgversion"; then
	if ${PKG_ADMIN_CMD} pmatch $abi $pkg; then :; else
	    ${ERROR_MSG} 1>&2 "Cannot check installed version of $pkg"
	fi
    fi

    # print result
    ${ECHO} "$pkg$pkgversion"

    # test fd 3 existence and print other variables there if it exists, to
    # stdout otherwise.
    ${TEST} : 2>/dev/null 1>&3 || exec 3>&1
    ${ECHO} 1>&3 "PREFIX.$pkg:=$prefix"
    ${ECHO} 1>&3 "PKGVERSION.$pkg:=$pkg$pkgversion"
    ${ECHO} 1>&3 "SYSTEM_FILES.$pkg:=$flist"
    exit 0
fi

# If an error occured, print it
if ${TEST} $errors = yes; then
    if test -n "$pkgdesc"; then
	${ERROR_MSG} 1>&2 "Missing $type package $pkgdesc:"
    else
	${ERROR_MSG} 1>&2 "Missing $type package $abi:"
    fi
    $0 -v -p "$sysprefix" $pkg $abi "$@" 1>&2 ||:
    ${ERROR_MSG} 1>&2
    if test -n "$syspkg"; then
        ${ERROR_MSG} 1>&2 "Please install the $sys package $syspkg."
    else
	${ERROR_MSG} 1>&2 "Please install it before continuing."
    fi
    if test "$type" != "robotpkg"; then
	${ERROR_MSG} 1>&2 "- SYSTEM_PREFIX or PREFIX.$pkg can be set"	\
		"to the installation prefix"
	${ERROR_MSG} 1>&2 "  of this package in robotpkg.conf."
    fi
    if test -n "$robotpkg"; then
	${ERROR_MSG} 1>&2 "- If no $abi package can be made available"	\
		"in your"
	${ERROR_MSG} 1>&2 "  system, you can use the robotpkg version,"	\
		"by setting in robotpkg.conf"
	${ERROR_MSG} 1>&2 "		PREFER.$pkg=	robotpkg"
    fi
    ${ERROR_MSG} 1>&2
fi

exit 2
