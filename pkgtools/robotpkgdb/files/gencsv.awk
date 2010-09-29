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
#                 List of explicitly listed runtime depencencies by name.
#                 I.e.  "xless-[0-9]* pvm-3.4.3"
# topbuilddepends[]  : index=pkgdir (math/scilab)
#                 List of explicitly listed build depencencies by name.


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
	    topdepends[pkg] = topdepends[pkg] " " pkgpat;
	} else {
	    topbuilddepends[pkg] = topbuilddepends[pkg] " " pkgpat;
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
    if( NF>=3 ) {
      license[$2] = substr($0, index($0, $3));
    } else {
      license[$2] = "";
    }
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

    printf("Generating CSV file\n");

    # Output format:
    #  package-name|package-path|installation-prefix|comment|
    #  description-file|mastersite|masterrepository|maintainer|categories|
    #  build deps|run deps|for arch|not for opsys|homepage|license-file

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
	gsub(/^ /, "", topbuilddepends[toppkg]);
	gsub(/ $/, "", topbuilddepends[toppkg]);
	printf("%s|", topbuilddepends[toppkg]) | indexf;
	gsub(/^ /, "", topdepends[toppkg]);
	gsub(/ $/, "", topdepends[toppkg]);
	printf("%s|", topdepends[toppkg]) | indexf;
	printf("%s|", onlyfor[toppkg]) | indexf;
	printf("%s|", notfor[toppkg]) | indexf;
	printf("%s|", homepage[toppkg]) | indexf;
	printf("%s", license[toppkg]) | indexf;
	printf("\n") | indexf;
    }
    close(indexf);
    printf("Indexed %d packages\n", pkgcnt);
    exit 0;
}
