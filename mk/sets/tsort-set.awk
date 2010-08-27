#!/usr/bin/awk -f
#
# Copyright (c) 2010 LAAS/CNRS
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
    DEPS = MAKE " show-depends-pkgpaths"

    ARGSTART = 1
    if (ARGV[ARGSTART] == "--") {
	ARGSTART++
    }

    while (ARGC > ARGSTART) {
	ARGC--
	cmd = "cd " ROBOTPKG_DIR "/" ARGV[ARGC]
	if (system(cmd) == 0) {
	    stack[++stack[0]] = ARGV[ARGC]
	    pkgs = pkgs " " ARGV[ARGC]
	}
    }

    depgraph()
}


# --- depgraph -------------------------------------------------------------

# Compute the dependency graph of packages
#
function depgraph() {
    # gather all dependencies
    while (stack[0] > 0) {
	pkg = stack[stack[0]--]
	if (done[pkg]) continue
	if (index(pkgs, pkg) > 0)
	    print "scanning dependencies of " pkg > "/dev/stderr"
	done[pkg] = 1

	cmd = "cd " ROBOTPKG_DIR "/" pkg " && " DEPS
	while (cmd | getline dep) {
	    deps[pkg] =  deps[pkg] " " dep
	    stack[++stack[0]] = dep
	}
    }

    # print to tsort
    tsort = TSORT " 2>/dev/null"
    for(pkg in deps) {
	n = split(deps[pkg], d)
	print pkg " " pkg | tsort
	for(i=1; i<=n; i++) {
	    print d[i] " " pkg | tsort
	}
    }
    close(tsort)
}
