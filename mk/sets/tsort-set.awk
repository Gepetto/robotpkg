#!/usr/bin/awk -f
#
# Copyright (c) 2010-2011 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Thu Aug 26 2010
#

# set default commands
BEGIN {
    MAKE = ENVIRON["MAKE"]?ENVIRON["MAKE"]:"make"
    TEST = ENVIRON["TEST"]?ENVIRON["TEST"]:"test"
    TSORT = ENVIRON["TSORT"]?ENVIRON["TSORT"]:"tsort"
    ROBOTPKG_DIR =\
	ENVIRON["ROBOTPKG_DIR"]?ENVIRON["ROBOTPKG_DIR"]:"/opt/openrobots"
    DEPS = MAKE " show-depends-pkgpaths || echo '*'"
    order = 1;
    sort = 1;
    strict = 0;

    ARGSTART = 1
    while (ARGSTART < ARGC) {
	option = ARGV[ARGSTART]
	if (option == "--") {
	    ARGSTART++
	    break
	} else if (option == "-r") {
	    order = -1
	    ARGSTART++
	} else if (option == "-s") {
	    strict = 1
	    ARGSTART++
	} else if (option == "-n") {
	    sort = 0
	    ARGSTART++
	} else if (option == "-d") {
	    ROBOTPKG_DIR = ARGV[ARGSTART + 1]
	    ARGSTART+= 2
	} else if (match(option, /^-.*/) != 0) {
	    option = substr(option, RSTART + 1, RLENGTH)
	    print ARGV[0] ": unknown option -- " option > "/dev/stderr"
	    usage()
	    exit 1
	} else break
    }

    if (ARGC <= ARGSTART) {
	while (getline pkg < "-") input[pkg] = 1
    } else {
	while (ARGC > ARGSTART) {
	    ARGC--
	    input[ARGV[ARGC]] = 1
	}
    }

    for(pkg in input) {
	cmd = TEST " -d " ROBOTPKG_DIR "/" pkg
	if (system(cmd) == 0) {
	    stack[++stack[0]] = pkg
	} else {
	    print "No such package: " pkg > "/dev/stderr"
	    exit 2
	}
    }

    if (stack[0] == 0) exit 0
    depgraph()
}


# --- usage ----------------------------------------------------------------
#
function usage() {
    print "usage: " ARGV[0]						\
	" [-- [-r] [-s] [-n] [-d robotpkgdir]] [pkgpath ...]"		\
	> "/dev/stderr"
}

# --- depgraph -------------------------------------------------------------

# Compute the dependency graph of packages
#
function depgraph() {
    # gather all dependencies
    while (stack[0] > 0) {
	pkg = stack[stack[0]--]
	if (done[pkg]) continue
	if (sort) {
	    print "Scanning dependencies of " pkg > "/dev/stderr"
	} else {
	    print pkg
	}
	done[pkg] = 1

	if (sort || !strict) {
	    cmd = "cd " ROBOTPKG_DIR "/" pkg "&&" DEPS
	    while (cmd | getline dep) {
		if (dep == "*") exit 2
		deps[pkg] =  deps[pkg] " " dep
		stack[++stack[0]] = dep
	    }
	    close(cmd)
	}
    }
    if (!sort) return

    # print to tsort
    tsort = TSORT " 2>/dev/null"
    for(pkg in deps) {
	if (strict && !(pkg in input)) continue
	print pkg " " pkg | tsort

	n = split(deps[pkg], d)
	for(i=1; i<=n; i++) {
	    if (strict && !(d[i] in input)) d[i] = "-" d[i]
	    if (order > 0) {
		print d[i] " " pkg | tsort
	    } else {
		print pkg " " d[i] | tsort
	    }
	}
    }
    if (close(tsort)) {
	print "unable to sort dependencies" > "/dev/stderr"
	exit 2
    }
}
