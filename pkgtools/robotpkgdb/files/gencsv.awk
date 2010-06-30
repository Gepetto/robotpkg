#!/usr/bin/awk -f
# $NetBSD: genindex.awk,v 1.6 2006/12/15 13:15:06 martti Exp $
#
# Copyright (c) 2010 LAAS/CNRS
# Copyright (c) 2002, 2003 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Dan McMahill.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#


# Global variables
#-----------------
# The following associative arrays are used for storing the dependency
# information and other information for the packages
#
# topdepends[]  : index=pkgdir (math/scilab)
#                 List of explicitly listed depencencies by name.
#                 I.e.  "xless-[0-9]* pvm-3.4.3"
#
# alldepends[]  : index=pkgdir (math/scilab)
#                 Flattened dependency list by name.
#
#


BEGIN {
    debug = 0;
    printf("Reading database file\n");
}

#conflicts /usr/pkgsrc/math/scilab
#depends /usr/pkgsrc/math/scilab xless-[0-9]*:../../x11/xless pvm-3.4.3:../../parallel/pvm3
#

/^(build_)?depends / {
#
# Read in the entire depends tree
# These lines look like:
#
#depends /usr/pkgsrc/math/scilab xless-[0-9]*:../../x11/xless pvm-3.4.3:../../parallel/pvm3
#build_depends /usr/pkgsrc/math/scilab libtool-base>=1.4.20010614nb9:../../devel/libtool-base
#
    deptype = $1;
    pkg = $2;

    if (!(pkg in topdepends)) { topdepends[pkg] = "" }
    if (!(pkg in topbuilddepends)) { topbuilddepends[pkg] = "" }

    for (i = 3; i <= NF; i++) {
	split($i, a, ":");
	pkgpat = a[1];
	pkgdir = a[2];
	if (pkgdir != "") {
	    sub(/[\.\/]*/, "", pkgdir);
	    if (pkgdir !~ /\//) {
		pkgcat = pkg;
		gsub(/\/.*/, "", pkgcat);
		pkgdir = pkgcat "/" pkgdir;
	    }
	}
	if (debug) {
	    printf("package in directory %s %s on:\n", pkg, deptype);
	    printf("\tpkgpat = %s\n", pkgpat);
	    printf("\tpkgdir = %s\n", pkgdir);
	}

	# store the package directory in a associative array with the wildcard
	# pattern as the index since we will need to be able to look this up
	# later
	pat2dir[pkgpat] = pkgdir;

	if (deptype == "depends") {
	    topdepends[pkg] = topdepends[pkg] " " pkgpat " ";
	} else {
	    topbuilddepends[pkg] = topbuilddepends[pkg] " " pkgpat " ";
	}
    }

    next;
}

/^comment / {
    comment[$2] = substr($0, index($0, $3));
    next;
}

/^categories / {
    # note: we pick out the categories slightly differently than the comment
    # and homepage because the category name will be included in the directory
    # name and hence the index() call points to the wrong location
    categories[$2] = $3;
    for(i = 4; i <= NF; i = i + 1) {
	categories[$2] = categories[$2] " " $i;
    }
    next;
}

/^descr / {
    descr[$2] = substr($0, index($0, $3));
    next;
}

/^homepage / {
    if( NF>=3 ) {
	homepage[$2] = substr($0, index($0, $3));
    } else {
	homepage[$2] = "";
    }
    next;
}

/^index / {
    # read lines like: index /usr/pkgsrc/math/scilab scilab-2.6nb3
    # and store the directory name in a associative array where the index
    # is the package name and in a associative array that lets us lookup
    # name from directory.
    pkgname2dir[$3] = $2;
    pkgdir2name[$2] = $3;
    next;
}

/^version / {
    version[$2] = substr($0, index($0, $3));
    next;
}

/^license / {
    license[$2] = substr($0, index($0, $3));
    next;
}

/^distfiles / {
    if( NF>=3 ) {
	distfiles[$2] = substr($0, index($0, $3));
    } else {
	distfiles[$2] = "";
    }
    next;
}

/^mastersites / {
    if( NF>=3 ) {
	mastersites[$2] = substr($0, index($0, $3));
    } else {
	mastersites[$2] = "";
    }
    next;
}

/^masterrepository / {
    if( NF>=3 ) {
	masterrepository[$2] = substr($0, index($0, $3));
    } else {
	masterrepository[$2] = "";
    }
    next;
}

/^maintainer / {
    maintainer[$2] = substr($0, index($0, $3));
    next;
}

/^notfor / {
    if( NF>=3 ) {
	notfor[$2] = substr($0, index($0, $3));
    } else {
	notfor[$2] = "";
    }
    next;
}

/^onlyfor / {
    if( NF>=3 ) {
	onlyfor[$2] = substr($0, index($0, $3));
    } else {
	onlyfor[$2] = "";
    }
    next;
}

/^prefix / {
    prefix[$2] = substr($0, index($0, $3));
    next;
}

/^wildcard / {
    wildcard[$2] = substr($0, index($0, $3));
    next;
}

#
# Now recurse the tree to give a flattened depends list for each pkg
#

END {
    if( SORT == "" ) { SORT = "sort"; }
    indexf = SORT " > robotpkgdb.csv";

    printf("Flattening dependencies\n");
    for (toppkg in topdepends) {
	find_all_depends(toppkg, "run");
	if (debug)
	    printf("%s depends on: %s\n", toppkg, alldepends[toppkg]);
	flatdepends[toppkg] = alldepends[toppkg];
    }

    # clear out the flattened depends list and repeat for the build depends
    for( pkg in alldepends) { delete alldepends[pkg]; }

    printf("Flattening build dependencies\n");
    for (toppkg in topbuilddepends){
	find_all_depends(toppkg, "build");
	if (debug)
	    printf("%s build_depends on: %s\n", toppkg, alldepends[toppkg]);
    }

    printf("Generating CSV file\n");

    # Output format:
    #  package-name|package-path|installation-prefix|comment|
    #  description-file|maintainer|categories|build deps|run deps|for arch|
    #  not for opsys|homepage

    pkgcnt = 0;
    for (toppkg in topdepends) {
	pkgcnt++;
	printf("%s|", pkgdir2name[toppkg]) | indexf;
	printf("%s|", toppkg) | indexf;
	printf("%s|", version[toppkg]) | indexf;
	printf("%s|", comment[toppkg]) | indexf;
	printf("%s|", descr[toppkg]) | indexf;
	printf("%s|", distfiles[toppkg]) | indexf;
	printf("%s|", mastersites[toppkg]) | indexf;
	printf("%s|", masterrepository[toppkg]) | indexf;
	printf("%s|", maintainer[toppkg]) | indexf;
	printf("%s|", categories[toppkg]) | indexf;
	gsub(/^ /, "", alldepends[toppkg]);
	gsub(/ $/, "", alldepends[toppkg]);
	printf("%s|", alldepends[toppkg]) | indexf;
	gsub(/^ /, "", flatdepends[toppkg]);
	gsub(/ $/, "", flatdepends[toppkg]);
	printf("%s|", flatdepends[toppkg]) | indexf;
	printf("%s|", onlyfor[toppkg]) | indexf;
	printf("%s|", notfor[toppkg]) | indexf;
	printf("%s", homepage[toppkg]) | indexf;
	printf("\n") | indexf;
    }
    close(indexf);
    printf("Indexed %d packages\n", pkgcnt);
    exit 0;
}

function find_all_depends (pkg, type, pkgreg, i, deps, depdir, topdep) {
    # pkg is the package directory, like math/scilab

    # if we find the package already has been fully depended
    # then return the depends list
    if (pkg in alldepends) { return(alldepends[pkg]); }

    # if this package has no top dependencies, enter an empty flat dependency
    # list for it.
    if ( type == "run" ) {
	# we only want run dependencies
	topdep = topdepends[pkg];
    } else {
	# we only want build dependencies
	topdep = topbuilddepends[pkg];
    }
    if (topdep ~ "^[ \t]*$") {
	alldepends[pkg] = " ";
	return(alldepends[pkg]);
    }

    # recursively gather depends that each of the depends has
    pkgreg = reg2str(pkg);
    split(topdep, deps);
    i = 1;
    alldepends[pkg] = " ";
    while ( i in deps ) {
	# figure out the directory name associated with the package hame
	# in (wild card/dewey) version form
	depdir = pat2dir[deps[i]];

	# if we do not already have this dependency (deps[i]) listed, then add
	# it.  However, we may have already added it because another package
	# we depend on may also have depended on deps[i].
	if (alldepends[pkg] !~ reg2str(deps[i])) {
	    alldepends[pkg] = alldepends[pkg] " " deps[i]
	    if (depdir != "") {
		alldepends[pkg] = alldepends[pkg] " "	\
		    find_all_depends(depdir, type);
	    }
	}

	i = i + 1;
    } # while i

    alldepends[pkg] = uniq(alldepends[pkg]);
    return(alldepends[pkg]);
}

#
# take a string which has special characters like '+' in it and
# escape them.  Also put a space before and after since that's how
# we'll distinguish things like gnome from gnome-libs
#
function reg2str(reg){
    gsub(/\./, "\\.", reg);
    gsub(/\+/, "\\+", reg);
    gsub(/\*/, "\\*", reg);
    gsub(/\?/, "\\?", reg);
    gsub(/\[/, "\\[", reg);
    gsub(/\]/, "\\]", reg);
    reg = " "reg" ";
    return(reg);
}

#
# accepts a full path to a package directory, like "/usr/pkgsrc/math/scilab"
# and returns just the last 2 directories, like "math/scilab"
#
function fulldir2pkgdir(d, i){
	i = match(d, /\/[^\/]+\/[^\/]+$/);
	return substr(d, i + 1);
}

#
# take the depends lists and uniq them.
#
function uniq(list, deps, i, ulist) {
    # split out the depends
    split(list, deps);

    i = 1;
    ulist = " ";
    while (i in deps) {
	if (ulist !~reg2str(deps[i])) {
	    ulist = ulist deps[i]" ";
	}
	i++;
    }
    return(ulist);
}
