#!@SH@ -e
#
# Copyright (c) 2009 LAAS/CNRS
# Copyright (c) 2001-2009 by David Brownlee (abs@NetBSD.org)
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
# 
# From $NetBSD: pkg_chk.sh,v 1.61 2008/12/20 09:50:59 abs Exp $
#
# robotpkg_chk is entirely based on pkg_chk, from the NetBSD pkgsrc project, by 
# David Brownlee <abs@NetBSD.org> and Stoned Elipot. robotpkg_chk is a stripped
# down version, adapted to work with robotpkg. pkg_chk is distributed with no
# particular license, so I assumed a BSD one and kept the original authors in
# the copyright holders.
#
#                                            Anthony Mallet on Sat Mar 14 2009
#

# TODO: Make -g check dependencies and tsort
# TODO: Make -g list user-installed packages first, followed by commented
#	out automatically installed packages
# TODO: List user-installed packages that are not in config

PATH=${PATH}:/usr/sbin:/usr/bin

SUMMARY_FILE=pkg_summary.gz

is_binary_available()
{
    if [ -n "$PKGDB" ]; then
	for iba_pkg in $PKGDB; do
	    case $iba_pkg in
		*:"$1")
		    return 0;
		;;
	    esac
        done
	return 1;
    else
	if [ -f "$PACKAGES/$1$PKG_SUFX" ]; then
	    return 0;
	else
	    return 1;
	fi
    fi
}

bin_pkg_info2pkgdb()
{
    ${AWK} '/^PKGNAME=/ {sub("^PKGNAME=", ""); PKGNAME=$0} \
            /^PKGPATH=/ {sub("^PKGPATH=", ""); printf("%s:%s ", $0, PKGNAME)}'
}

check_packages_installed()
{
    MISSING_TODO=
    MISMATCH_TODO=
    UNSAFE_TODO=

    for pkgdir in $*; do
	if [ -n "$opt_s" ]; then
	    extract_pkg_vars $pkgdir PKGNAME
	else
	    PKGNAME=`pkgdir2pkgname $pkgdir`
	fi
	if [ -z "$PKGNAME" ]; then
	    MISS_DONE=$MISS_DONE" "$pkgdir
	    continue
	fi

	pkginstalled=`${PKG_INFO} -e ${PKGNAME%-*} ||:`
	i="$pkgdir - "

	if [ "$pkginstalled" = "$PKGNAME" ]; then
	    if [ -n "$opt_i$opt_I" ]; then
		unsafe=`${PKG_INFO} -qQ ${UNSAFE_VAR} $PKGNAME`
	    else
		unsafe=
	    fi
	    if [ -z "$opt_i$opt_I" -o -z "$unsafe" ]; then
		verbose "$PKGNAME: OK"
		continue
	    fi

	    i=$i"$pkginstalled unsafe"
	    UNSAFE_TODO="$UNSAFE_TODO $pkginstalled"
	elif [ -n "$pkginstalled" ]; then
	    i=$i"$pkginstalled < $PKGNAME"
	    MISMATCH_TODO="$MISMATCH_TODO $pkginstalled"
	else
	    i=$i"$PKGNAME missing"
	    MISSING_TODO="$MISSING_TODO $PKGNAME $pkgdir"
	fi

	if is_binary_available $PKGNAME; then
	    i=$i" (binary package available)"
	fi

	msg $i
    done
}

cleanup_and_exit()
    {
    exit "$@"
    }

delete_pkgs()
{
    for pkg in $*; do
	if ${PKG_INFO} -qe $pkg; then
	    run_cmd "${PKG_DELETE} -r $pkg" 1
	fi
    done
}

extract_make_vars()
{
    makefile=$1
    shift
    values=`${MAKE} -f $makefile show-vars VARNAMES="$*"` || 
	fatal "Could not determine installation parameters"
    while read -r ${1:-none}; do
	verbose_var $1
	shift
    done <<EOF
	$values
EOF
}

extract_pkg_vars()
{
    PKGDIR=$1
    PKGNAME=
    shift;
    if [ ! -f $ROBOTPKG_DIR/$PKGDIR/Makefile ];then
	msg "WARNING: No $PKGDIR/Makefile - package moved or obsolete?"
	return
    fi
    cd $ROBOTPKG_DIR/$PKGDIR
    extract_make_vars Makefile "$@"
    if [ -z "$PKGNAME" ]; then
	fatal "Unable to extract PKGNAME for $pkgdir"
    fi
}

extract_variables()
{
    # determine PACKAGES, and PKGCHK_CONF as well as AWK, GREP, SED
    #
    cd $ROBOTPKG_DIR/pkgtools/robotpkg_chk
    if [ -n "$opt_g" ]; then
	extract_make_vars Makefile					\
	    LOCALBASE ROBOTPKG_CHK_CONF					\
	    AWK GREP SED GZIP_CMD ID SORT SU_CMD TSORT			\
	    PKG_INFO
    elif [ -z "$opt_b" -o -n "$opt_s" ]; then
	extract_make_vars Makefile					\
	    LOCALBASE PACKAGES ROBOTPKG_CHK_CONF ROBOTPKG_CHK_UPDATECONF\
	    AWK GREP SED GZIP_CMD ID SORT SU_CMD TSORT			\
	    PKG_ADD PKG_DELETE PKG_ADMIN PKG_INFO PKG_SUFX
	if [ -z "$PACKAGES" ]; then
	    PACKAGES=$ROBOTPKG_DIR/packages
	fi
    else
	extract_make_vars Makefile					\
	    PACKAGES ROBOTPKG_CHK_CONF ROBOTPKG_CHK_UPDATECONF PKG_SUFX
	if [ -z "$PACKAGES" ] ; then
	    PACKAGES=$ROBOTPKG_DIR/packages
	fi
    fi

    # .tgz/.tbz to regexp
    PKG_SUFX_RE=`echo $PKG_SUFX | ${SED} 's/[.]/[.]/'`

    if [ -z "$ROBOTPKG_CHK_CONF" ];then
	ROBOTPKG_CHK_CONF=$LOCALBASE/etc/robotpkg_chk.conf
    fi
    if [ -z "$ROBOTPKG_CHK_UPDATECONF" ];then
	ROBOTPKG_CHK_UPDATECONF=$LOCALBASE/etc/robotpkg_chk_update.conf
    fi
}

fatal()
{
    msg "*** $@" >&2
    cleanup_and_exit 1
}

fatal_later()
{
    msg "*** $@" >&2
    fatal_later=1
}

fatal_later_check()
{
    if [ "$fatal_later" = 1 ] ; then
	cleanup_and_exit 1
    fi
}

fatal_maybe()
    {
    if [ -z "$opt_k" ];then
	fatal "$@"
    else
	msg "$@"
    fi
    }

generate_conf_from_installed()
{
    if [ -r $1 ]; then
	mv $1 $1.old
    fi
    echo "# Generated automatically at `${DATE}`" > $1
    pkgdirs_from_installed >> $1
}

get_bin_pkg_info()
{
    summary_file=$PACKAGES/$SUMMARY_FILE
    if [ -f $summary_file ] ; then
	if [ -z "$(find $PACKAGES -type f -newer $summary_file -name '*.t[bg]z')" ] ; then
	    zcat $summary_file
	    return;
	fi
	echo "*** Ignoring $SUMMARY_FILE as PACKAGES contains newer files" >&2
    fi
    list_bin_pkgs | ${XARGS} ${PKG_INFO} -X
}

list_bin_pkgs()
{
    ls -t $PACKAGES | ${SED} -n "/$PKG_SUFX_RE$/s|^|$PACKAGES/|p"
}

# Given a binary package filename as the first argumennt, return a list
# of exact package versions against which it was built and on which it
# depends
#
list_dependencies()
{
    ${PKG_INFO} -. -q -n $1 | ${GREP} .. || true
}

# Pass a list of pkgdirs, outputs a tsorted list including any dependencies
#
list_packages()
{
    # Convert passed in list of pkgdirs to a list of binary package files
    pkglist=''
    for pkgdir in $*; do
	pkgname=`pkgdir2pkgname $pkgdir`
	if is_binary_available "$pkgname"; then
	    pkglist="$pkglist $pkgname$PKG_SUFX"
	else
	    fatal_later "${pkgname:-$pkgdir} - no binary package found"
	fi
    done

    # Variables used in this loop:
    # pkglist: Current list of binary package files to check for dependencies
    # next_pkglist: List of binary package files to check after pkglist
    # pairlist: completed list of package + dependency for use in tsort
    while [ -n "$pkglist" ]; do
	verbose "pkglist: $pkglist"
	for pkg in $pkglist; do
	    set -o noglob
	    deplist=`list_dependencies $PACKAGES/$pkg`
	    verbose "$pkg: dependencies - $deplist"
	    if [ -n "$deplist" ] ; then
		for depmatch in $deplist ; do
		    dep=`${PKG_ADMIN} -b -d $PACKAGES lsbest "$depmatch"`
		    if [ -z "$dep" ] ; then
			fatal_later "$depmatch: dependency missing for $pkg"
		    else
			pairlist="$pairlist$dep $pkg\n"
			case $dep_cache in
			    *" $dep "*)
				# depmatch_cache is a quick cache of already
				verbose "$pkg: $deplist - cached"
				;;
			    *)
				next_pkglist="$next_pkglist $dep"
				dep_cache="$dep_cache $dep "
				;;
			esac
		    fi
		done
	    else
		pairlist="$pairlist$pkg $pkg\n"
	    fi
	    set +o noglob
	done
	pkglist="$next_pkglist"
	next_pkglist=
    done
    if [ -z "$opt_k" ]; then
	fatal_later_check
    fi
    printf "$pairlist" | ${TSORT}
}

pkgdir2pkgname()
{
    pkgdir=$1
    for pkgline in $PKGDB; do
	case $pkgline in
	    "$pkgdir:"*)
		echo ${pkgline#*:}
		return;
	    ;;
	esac
    done
}

pkgdirs_from_conf()
{
    CONF=$1; shift
    if [ ! -r $CONF ];then
	fatal "Unable to read ROBOTPKG_CHK_CONF '$CONF'"
    fi

    # merge list of pkgdirs from CONF and $*
    ${AWK} -v alreadyset="$*" '
	BEGIN {
	    split(alreadyset, tmp, " ");
	    for (pkg in tmp) {
		print tmp[pkg]
		skip[tmp[pkg]] = 1
	    }
	}
	{
	    sub("#.*", "")
	    if (NF == 0 || skip[$1]) next
	    print $1
	    skip[$1] = 1
	}
    ' < $CONF
}

pkgdirs_from_installed()
{
    ${PKG_INFO} -qa -Q PKGPATH | ${SORT}
}

depgraph_installed()
{
    for pkg in $*; do
	${PKG_INFO} -qe $pkg || continue
	echo $pkg $pkg
	for dep in `${PKG_INFO} -qR $pkg`; do
	    echo $pkg $dep
	done
	for dep in `${PKG_INFO} -qN $pkg`; do
	    echo $dep $pkg
	done
    done
}

msg()
    {
    if [ -n "$opt_L" ] ; then
	echo "$@" >> "$opt_L"
    fi
    if [ -n "$opt_l" ] ; then
	echo "$@" >&2
    else
	echo "$@"
    fi
    }

msg_progress()
{
    if [ -z "$opt_q" ] ; then
	msg; msg "[ $@ ]"; msg
    fi
}

pkg_install()
{
    PKGNAME=$1
    PKGDIR=$2

    FAIL=
    if ${PKG_INFO} -qe $PKGNAME; then
	msg "$PKGNAME installed in previous stage"
	run_cmd "${PKG_ADMIN} unset automatic $PKGNAME"
    elif [ -n "$opt_b" ] && is_binary_available $PKGNAME; then
	if [ -n "$saved_PKG_PATH" ]; then
	    export PKG_PATH=$saved_PKG_PATH
	fi
	run_cmd "${PKG_ADD} $PACKAGES/$PKGNAME$PKG_SUFX"
	if [ -n "$saved_PKG_PATH" ] ; then
	    unset PKG_PATH
	fi
    elif [ -n "$opt_s" ]; then
	run_cmd "cd $ROBOTPKG_DIR/$PKGDIR && ${MAKE} clean CLEANDEPENDS=yes" 1
	run_cmd "cd $ROBOTPKG_DIR/$PKGDIR && ${MAKE} update CLEANDEPENDS=yes"
    fi

    if [ -z "$opt_n" -a -z "$opt_q" ]; then
	${PKG_INFO} -qe $PKGNAME || FAIL=1
    fi

    if [ -n "$FAIL" ]; then
	FAIL_DONE=$FAIL_DONE" "$PKGNAME
    else
	INSTALL_DONE=$INSTALL_DONE" "$PKGNAME
    fi
}

pkg_replace()
{
    pkg=$1
    PKGDIR=$2
    extract_pkg_vars $PKGDIR PKGNAME

    FAIL=
    installed=
    if ${PKG_INFO} -qe $PKGNAME; then
	if [ -z "`${PKG_INFO} -qQ $UNSAFE_VAR $PKGNAME`" ]; then
	    msg "$PKGNAME replaced in previous stage"
	    run_cmd "${PKG_ADMIN} unset automatic $PKGNAME"
	    return 0
	fi
	installed=yes
    fi

    if [ -n "$opt_b" -a -z "$installed" ] && is_binary_available $PKGNAME; then
	for dep in `${PKG_INFO} -qR ${PKGNAME%-*}`; do
	    run_cmd "${PKG_ADMIN} set unsafe_depends_strict=yes $dep" 1
	    run_cmd "${PKG_ADMIN} set unsafe_depends=yes $dep" 1
	done
	run_cmd "${PKG_DELETE} -f ${PKGNAME%-*}" 1
	if [ -n "$saved_PKG_PATH" ]; then
	    export PKG_PATH=$saved_PKG_PATH
	fi
	run_cmd "${PKG_ADD} $PACKAGES/$PKGNAME$PKG_SUFX"
	if [ -n "$saved_PKG_PATH" ] ; then
	    unset PKG_PATH
	fi
    elif [ -n "$opt_s" ]; then
	run_cmd "cd $ROBOTPKG_DIR/$PKGDIR && ${MAKE} clean CLEANDEPENDS=yes" 1
	run_cmd "cd $ROBOTPKG_DIR/$PKGDIR && ${MAKE} replace"
	if [ -z "$FAIL" ]; then
	    run_cmd "cd $ROBOTPKG_DIR/$PKGDIR && ${MAKE} clean CLEANDEPENDS=yes" 1
	fi
    fi

    if [ -z "$opt_n" -a -z "$opt_q" ]; then
	${PKG_INFO} -qe $PKGNAME || FAIL=1
    fi

    if [ -n "$FAIL" ]; then
	FAIL_DONE=$FAIL_DONE" "$PKGNAME
    else
	REPLACE_DONE=$REPLACE_DONE" "$pkg
    fi
}

pkg_installlist()
{
    msg_progress Install
    while [ $# != 0 ]; do
	pkg_install $1 $2
	shift 2;
    done
}

pkg_replacelist()
{
    msg_progress Replace

    REPLACE_TODO=" "$*" "
    while [ -n "$REPLACE_TODO" ]; do
	DEPGRAPH_INSTALLED=`depgraph_installed $REPLACE_TODO`
	tsorted=`tsort <<-EOF
	    $DEPGRAPH_INSTALLED
	EOF
	`

	# look for next package to replace and remove it from REPLACE_TODO
	pkg=
	for p in $tsorted; do
	    case $REPLACE_TODO in
		*" $p "*)
		    pkg=$p
		    REPLACE_TODO=`${SED} -e "s| $p | |" <<-EOF
			    $REPLACE_TODO
			EOF
		    `
		    break ;;
	    esac
	done
	[ -z "$pkg" ] && break;

	pkgdir=`${PKG_INFO} -qQ PKGPATH ${pkg%-*}`
	pkg_replace $pkg $pkgdir

	if [ -z "$opt_n" ]; then
	    [ -z "`${PKG_INFO} -Q unsafe_depends_strict ${pkg%-*}`" ] || \
		abort "package ${pkg%-*} still has unsafe_depends_strict."
	    [ -z "`${PKG_INFO} -Q unsafe_depends ${pkg%-*}`" ] || \
		abort "package ${pkg%-*} still has unsafe_depends."
	fi

	msg_progress "Re-checking for unsafe installed packages (${UNSAFE_VAR}=yes)"
	for p in `${PKG_INFO} -qR ${pkg%-*}`; do
	    flag=`${PKG_INFO} -qQ ${UNSAFE_VAR} $p`
	    if [ -n "$flag" ]; then
		case $REPLACE_TODO in
		    *" $p "*) ;;
		    *) REPLACE_TODO=$REPLACE_TODO""$p" ";;
		esac
	    fi
	done
    done
}


run_cmd()
{
    FAIL=
    if [ -n "$2" ]; then
	FAILOK=$2
    else
	FAILOK=$opt_k
    fi
    if [ -z "$opt_q" ]; then
	msg `${DATE} +%R` $1
    fi
    if [ -z "$opt_n" -a -z "$opt_q" ];then
	if [ -n "$opt_L" ] ; then
	    eval $1 >> "$opt_L" 2>&1 || FAIL=1
	else
	    eval $1 || FAIL=1
	fi
	if [ -n "$FAIL" ] ; then
            msg "** '$1' failed"
	    if [ -n "$opt_L" ] ; then
		tail -100 "$opt_L" | egrep -v '^(\*\*\* Error code 1|Stop\.)' |
			tail -40
	    fi
            if [ "$FAILOK" != 1 ]; then
                fatal "** '$1' failed"
            fi
        fi
    fi
}

run_cmd_su()
{
    if [ -n "$SU_CMD" ]; then
	run_cmd "${SU_CMD} '$1'" "$2"
    else
	run_cmd "$1" "$2"
    fi
}

set_path()
{
    case $1 in
	http://*|ftp://*|/*)	echo $1 ;;
	*)			echo $basedir/$1 ;;
    esac
}

usage()
    {
    if [ -n "$1" ] ; then
	echo "$@"
	echo
    fi
    echo "Usage: ${0##*/} [opts]
	-a      Add all missing packages
	-b      Use binary packages
	-C conf Use pkgchk.conf file 'conf'
	-g      Generate an initial robotpkg_chk.conf file
	-h      This help
	-i      Replace all mismatched packages one at a time (incremental)
	-I      Same as -i, with strict dependency mode 
	-k	Continue with further packages if errors are encountered
	-L file Redirect output from commands run into file
	-l	List binary packages including dependencies
	-n	Display actions that would be taken, but do not perform them
	-P dir  Set PACKAGES dir (overrides any other setting)
	-q	Do not display actions or take any action; only list packages
	-r	Recursively remove mismatches (use with care)
	-s      Use source for building packages
	-u      Update all mismatched packages
	-v      Verbose

robotpkg_chk verifies installed packages against robotpkg.
The most common usage is 'robotpkg_chk -u -q' to check all installed packages
or 'robotpkg_chk -u' to update all out of date packages.
For more advanced usage, see robotpkg_chk(8).

If neither -b nor -s is given, both are assumed with -b preferred.
"
    exit 1
    }

verbose()
    {
    if [ -n "$opt_v" ] ; then
	msg "$@" >&2
    fi
    }

verbose_var()
{
    if [ -n "$opt_v" ] ; then
	var=$1
	shift
	verbose Variable $var = $(eval echo \$$var) $@
    fi
}

# Hide PKG_PATH to avoid breakage in 'make' calls
saved_PKG_PATH=$PKG_PATH
unset PKG_PATH || true

# Set commands
test -n "$EXPR"		|| EXPR="@EXPR@"
test -n "$AWK"		|| AWK="@AWK@"
test -n "$GREP"		|| GREP="@GREP@"
test -n "$DATE"		|| DATE="@DATE@"
test -n "$GZIP_CMD"	|| GZIP_CMD="@GZIP_CMD@"
export GZIP_CMD
test -n "$ID"		|| ID="@ID@"
test -n "$MAKE"		|| MAKE="@MAKE@"
test -n "$ROBOTPKG_DIR"	|| ROBOTPKG_DIR="@ROBOTPKG_DIR@"
test -n "$PKG_ADD"	|| PKG_ADD="@PKG_ADD@"
test -n "$PKG_ADMIN"	|| PKG_ADMIN="@PKG_ADMIN@"
test -n "$PKG_DELETE"	|| PKG_DELETE="@PKG_DELETE@"
test -n "$PKG_INFO"	|| PKG_INFO="@PKG_INFO@"
test -n "$SED"		|| SED="@SED@"
test -n "$SORT"		|| SORT="@SORT@"
test -n "$TSORT"	|| TSORT="@TSORT@"
test -n "$XARGS"	|| XARGS="@XARGS@"

# process command-line options
while getopts C:L:P:abghiIklnpqrsuv opt; do
    case $opt in
	a)	opt_a=1 ;;
	b)	opt_b=1 ;;
	C)	opt_C="$OPTARG" ;;
	g)	opt_g=1 ;;
	h|\?)	opt_h=1 ;;
	i)	opt_i=1 ;;
	I)	opt_I=1 ;;
	k)	opt_k=1 ;;
	L)	opt_L="$OPTARG" ;;
	l)	opt_l=1 ;;
	n)	opt_n=1 ;;
	p)	opt_p=1 ;;
	P)	opt_P="$OPTARG" ;;
	q)	opt_q=1 ;;
	r)	opt_r=1 ;;
	s)	opt_s=1 ;;
	u)	opt_u=1 ;;
	v)	opt_v=1 ;;
    esac
done
shift `${EXPR} $OPTIND - 1`

# check arguments
if [ $# != 0 ]; then usage "Too many arguments given"; fi
if [ -n "$opt_h" ]; then usage; fi
if [ -z "$opt_a$opt_g$opt_i$opt_I$opt_l$opt_p$opt_r$opt_u" ]; then
    usage "Must specify at least one of -a, -g, -i, -I, -l, -p, -r or -u";
fi
if [ -n "$opt_i" -a -n "$opt_u" ]; then
    usage "You must choose either -i or -u";
fi

if [ ! -f "$ROBOTPKG_DIR/pkgtools/robotpkg_chk/Makefile" ] ; then
    fatal "Couldn't find robotpkg makefiles in $ROBOTPKG_DIR."
fi
verbose_var ROBOTPKG_DIR

if [ -z "$opt_b" -a -z "$opt_s" ]; then
    opt_b=1; opt_s=1;
fi

if [ -n "$opt_I" ]; then
    UNSAFE_VAR=unsafe_depends_strict; opt_i=1
elif [ -n "$opt_i" ]; then
    UNSAFE_VAR=unsafe_depends
fi

if [ -n "$opt_L" ]; then
    > $opt_L
fi

basedir=`pwd`
extract_variables

if [ -n "$opt_C" ]; then
    ROBOTPKG_CHK_CONF=`set_path $opt_C`
fi
if [ -n "$opt_P" ]; then
    PACKAGES=`set_path $opt_P`
fi
if [ -d $PACKAGES/All ]; then
    PACKAGES="$PACKAGES/All"
fi

if [ "`${ID} -u`" = 0 ] ; then
    SU_CMD=
fi

if [ -n "$opt_b" ]; then
    case $PACKAGES in
	http://*|ftp://*)
	    AWK_PARSE_SUMMARY='$1=="PKGNAME"{pkgname=$2} $1=="PKGPATH"{pkgpath=$2} NF==0{if (pkgpath && pkgname) print pkgpath ":" pkgname; pkgpath=""; pkgname=""} END{if (pkgpath && pkgname) print pkgpath ":" pkgname}'
            PKGDB=`ftp -o - $PACKAGES/$SUMMARY_FILE | ${GZIP_CMD} -cd \
		| ${AWK} -F= "$AWK_PARSE_SUMMARY"`;;
	*)
	    if [ -d "$PACKAGES" ] ; then
		msg_progress Scanning $PACKAGES
		PKGDB=`get_bin_pkg_info | bin_pkg_info2pkgdb`
	    fi;;
    esac
fi

if [ -n "$opt_g" ]; then
    verbose "Write $ROBOTPKG_CHK_CONF based on installed packages"
    generate_conf_from_installed $ROBOTPKG_CHK_CONF
fi

if [ -n "$opt_i$opt_I$opt_r$opt_u" ]; then
    verbose "Enumerate PKGDIRLIST from installed packages"
    PKGDIRLIST=`pkgdirs_from_installed`
fi

if [ -n "$opt_p" ] ; then
    pkgdirs_from_conf $ROBOTPKG_CHK_CONF $PKGDIRLIST
    exit
fi

# append to PKGDIRLIST based on conf
if [ -n "$opt_a$opt_l" ]; then
    verbose "Append to PKGDIRLIST based on config $ROBOTPKG_CHK_CONF"
    PKGDIRLIST=`pkgdirs_from_conf $ROBOTPKG_CHK_CONF $PKGDIRLIST`
fi

if [ -n "$opt_l" ] ; then
    list_packages $PKGDIRLIST
else
    msg_progress Checking installed
    check_packages_installed $PKGDIRLIST
fi

if [ -n "$MISMATCH_TODO" -a -z "$opt_i" ]; then
    delete_and_recheck=1
elif [ -n "$opt_u" -a -f $ROBOTPKG_CHK_UPDATECONF ]; then
    delete_and_recheck=1
fi

if [ -n "$delete_and_recheck" ]; then
    if [ -n "$opt_u" ]; then		 # Save current installed list
	if [ -z "$opt_n" -a -z "$opt_q" ]; then
	    if [ -f $ROBOTPKG_CHK_UPDATECONF ]; then
		msg "Merging in previous $ROBOTPKG_CHK_UPDATECONF"
		pkgdirs_from_installed >>$ROBOTPKG_CHK_UPDATECONF
		${SORT} -u -o $ROBOTPKG_CHK_UPDATECONF $ROBOTPKG_CHK_UPDATECONF
	    else
		pkgdirs_from_installed > $ROBOTPKG_CHK_UPDATECONF
	    fi
	fi
    fi
    if [ -n "$opt_r$opt_u" ]; then
	if [ -n "$MISMATCH_TODO" ]; then
	    delete_pkgs $MISMATCH_TODO
	    msg_progress Rechecking packages after deletions
	fi
	if [ -n "$opt_u" -a -z "$opt_q" ]; then
	    PKGDIRLIST=`pkgdirs_from_conf $ROBOTPKG_CHK_UPDATECONF $PKGDIRLIST`
	fi
	if [ -n "$opt_a$opt_u" -a -z "$opt_q" ]; then
	    check_packages_installed $PKGDIRLIST # May need to add more
	fi
    fi
fi

if [ -n "$MISMATCH_TODO$UNSAFE_TODO" -a -n "$opt_i" ]; then
    pkg_replacelist $MISMATCH_TODO $UNSAFE_TODO
fi

if [ -n "$MISSING_TODO" ]; then
    if [ -n "$opt_a$opt_u" ]; then
	pkg_installlist $MISSING_TODO
    fi
fi

if [ -n "$opt_u" -a -z "$FAIL_DONE" -a -f $ROBOTPKG_CHK_UPDATECONF ]; then
    run_cmd "rm -f $ROBOTPKG_CHK_UPDATECONF"
fi

[ -z "$MISS_DONE" ] ||		msg "Missing:$MISS_DONE"
[ -z "$REPLACE_DONE" ] ||	msg "Replaced:$REPLACE_DONE"
[ -z "$INSTALL_DONE" ] ||	msg "Installed:$INSTALL_DONE"

if [ -n "$FAIL_DONE" ] ; then
   msg "Failed:$FAIL_DONE"
   cleanup_and_exit 1
fi

cleanup_and_exit
