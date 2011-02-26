#!/usr/bin/awk -f
#
# Copyright (c) 2011 LAAS/CNRS
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
#                                           Anthony Mallet on Thu Feb 24 2011
#

# --- usage ----------------------------------------------------------------
#
# Output the usage message
function usage()
{
    print "Usage:"
    print "	" ARGV[0] " pmatch <patterns> <version> [<patterns> <version>]"
    print "	" ARGV[0] " reduce <patterns> [<patterns> ...]"
}

BEGIN {
    tests["<"] = DEWEY_LT = 1
    tests["<="] = DEWEY_LE = 2
    tests[">"] = DEWEY_GT = 3
    tests[">="] = DEWEY_GE = 4
    tests["=="] = DEWEY_EQ = 5
    tests["!="] = DEWEY_NE = 6

    mods["alpha"] = -3
    mods["beta"] = -2
    mods["pre"] = -1
    mods["rc"] = -1
    mods["pl"] = 0
    mods["_"] = 0
    mods["\\."] = 0

    if (ARGC < 3) { usage(); exit 2; }
    if (ARGV[1] == "pmatch") {
	print pmatch()
	exit 0
    }
    if (ARGV[1] == "reduce") {
	print reduce()
	exit 0
    }

    usage()
    exit 2
}


# --- reduce ---------------------------------------------------------------
#
# Match a pattern against a package version
#
function pmatch(	a, t, r, version, pattern, cur, ver, m)
{
    for(a = 2; a < ARGC; a+=2) {
	vextract(version, ARGV[a+1])
	if (version[2] != "==") { r[a] = "no"; continue; }
	mkversion(ver, version[3])

	r[a] = "yes"
	while(ARGV[a]) {
	    ARGV[a] = pextract(pattern, ARGV[a])
	    if (pattern[1]) m = pattern[1]
	    if (m != version[1]) { r[a] = "no"; break; }

	    t = tests[pattern[2]]
	    mkversion(cur, pattern[3])
	    if (!vtest(ver, t, cur)) { r[a] = "no"; break; }
	}
    }

    m = ""
    for(a in r) {
	if (m) m = m " "
	m = m r[a]
    }
    return m
}


# --- reduce ---------------------------------------------------------------
#
# Distill a version requirement list into a single interval that statisfies all
# the versions requirements. '!=' tests are put apart (they do not make an
# interval).
#
function reduce(	a, i, k, t, p, name, min, minop, max, maxop, ne, cur, r)
{
    for(a = 2; a < ARGC; a++) {
	while(ARGV[a]) {
	    ARGV[a] = pextract(pattern, ARGV[a])
	    if (pattern[1]) r = pattern[1]
	    i = name[r]++
	    p[r,"t",i] = pattern[2]
	    p[r,"v",i] = pattern[3]
	}
    }

    r = ""
    for(a in name) {
	minop = maxop = 0; ne = "";

	for(k=0; k<name[a]; k++) {
	    t = tests[p[a,"t",k]]
	    mkversion(cur, p[a,"v",k])

	    if (t == DEWEY_LT || t == DEWEY_LE || t == DEWEY_EQ) {
		if (!maxop || vtest(cur, maxop, max)) {
		    for (i in cur) max[i] = cur[i]
		    maxop = t == DEWEY_EQ ? DEWEY_LE : t
		}
	    }
	    if (t == DEWEY_GT || t == DEWEY_GE || t == DEWEY_EQ) {
		if (!minop || vtest(cur, minop, min)) {
		    for (i in cur) min[i] = cur[i]
		    minop = t == DEWEY_EQ ? DEWEY_GE : t
		}
	    }
	    if (t == DEWEY_NE) {
		if (ne && cur[-2] != ne) return ""
		ne = cur[-2]
	    }
	}

	if (minop && maxop && maxop != minop) {
	    if (!vtest(max, minop, min) || !vtest(min, maxop, max)) return ""
	}

	if (r) r = r " "
	if (a) r = r a
	if (minop) r = r strop(minop) min[-2]
	if (maxop && maxop != minop) r = r strop(maxop) max[-2]
	if (r) r = r " "
	if (ne) r = r a "!=" ne
    }
    return r
}


# --- mkcomponent ----------------------------------------------------------
#
# Make a component of a version number from a string.
#
# '.' encodes as Dot which is '0'
# '_' encodes as 'patch level', or 'Dot', which is 0.
# 'pl' encodes as 'patch level', or 'Dot', which is 0.
# 'alpha' encodes as 'alpha version', or Alpha, which is -3.
# 'beta' encodes as 'beta version', or Beta, which is -2.
# 'rc' encodes as 'release candidate', or RC, which is -1.
# 'nb' encodes as 'netbsd version', which is used after all other tests
#
function mkcomponent(ap, str) {
    # digits
    if (match(str, /^[0-9]+/)) {
	ap[0]++
	ap[ap[0]] = substr(str, RSTART, RLENGTH)
	sub(/^0+/, "", ap[ap[0]])
	return substr(str, RLENGTH+1)
    }

    # modifiers
    for(m in mods) {
	if (match(str, "^" m)) {
	    ap[0]++
	    ap[ap[0]] = mods[m]
	    return substr(str, RLENGTH+1)
	}
    }

    # pkgrevision
    if (match(str, /^r[0-9]+/)) {
	ap[-1] = substr(str, RSTART+1, RLENGTH)
	sub(/^0+/, "", ap[-1])
	return substr(str, RLENGTH+1)
    }

    # alpha
    if (match(str, /^[a-zA-Z]/)) {
	ap[0]++
	ap[ap[0]] = tolower(substr(str, 1, 1))
	if (match("abcdefghijklmnopqrstuvwxyz", ap[ap[0]]))
	    ap[ap[0]] = RSTART-1
	else
	    ap[ap[0]] = 0
	return substr(str, RLENGTH+1)
    }

    # invalid
    return substr(str, 2)
}


# --- mkcomponent ----------------------------------------------------------
#
# Make a version number string into an array of comparable ints
#
function mkversion(ap, str)
{
    ap[0] = 0
    ap[-1] = 0
    ap[-2] = str
    while(str)
	str = mkcomponent(ap, str)
}


# --- strop ----------------------------------------------------------------
#
# Make a string from a test number
#
function strop(t,	i)
{
    for(i in tests) if (tests[i] == t) return i
    return ""
}


# --- result ---------------------------------------------------------------
#
# compare the result against the test we were expecting
#
function result(cmp, i)
{
    if (i == DEWEY_LT) return cmp < 0
    if (i == DEWEY_LE) return cmp <= 0
    if (i == DEWEY_GT) return cmp > 0
    if (i == DEWEY_GE) return cmp >= 0
    if (i == DEWEY_EQ) return cmp == 0
    if (i == DEWEY_NE) return cmp != 0
    return 0;
}


# --- vtest ----------------------------------------------------------------
#
# do the test on the 2 vectors
#
function vtest(lhs, tst, rhs,		i, c, cmp)
{
    c = lhs[0] > rhs[0] ? lhs[0] : rhs[0]
    for(i = 1; i <= c; i++) {
	if (cmp = lhs[i] - rhs[i]) return result(cmp, tst)
    }
    return result(lhs[-1] - rhs[-1], tst)
}


# --- pextract -------------------------------------------------------------
#
# extract name, test and version
#
function pextract(pattern, str)
{
    while(match(str, /^[ \t]+/))
	str = substr(str, RLENGTH+1)

    if (match(str, /[><=!]=?/)) {
	pattern[1] = substr(str, 1, RSTART-1)
	pattern[2] = substr(str, RSTART, RLENGTH)
	str = substr(str, RSTART+RLENGTH)
	if (match(str, /([ \t]+.*)?[><=!]=?/)) {
	    pattern[3] = substr(str, 1, RSTART-1)
	    str = substr(str, RSTART)
	} else {
	    pattern[3] = str
	    str = ""
	}
	return str
    }

    pattern[1] = str
    return ""
}


# --- vextract -------------------------------------------------------------
#
# extract name and version
#
function vextract(pattern, str)
{
    while(match(str, /^[ \t]+/))
	str = substr(str, RLENGTH+1)

    pattern[2] = "=="
    if (match(str, /-[^-]$/)) {
	pattern[1] = substr(str, 1, RSTART-1)
	pattern[3] = substr(str, RSTART+1)
    } else {
	pattern[3] = str
    }
}
