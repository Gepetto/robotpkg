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
    print "	" ARGV[0] " getopts <patterns> <options> [<option> ...]"
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
        for(a = 2; a < ARGC; a+=2)
            print (pmatch(ARGV[a], ARGV[a+1]) ? "yes" : "no")
	exit 0
    }
    if (ARGV[1] == "reduce") {
        delete ARGV[0]
        delete ARGV[1]
	print reduce(ARGV)
	exit 0
    }
    if (ARGV[1] == "getopts") {
        for(a = 3; a < ARGC; a++)
            l = l " " ARGV[a]
        split(l, list)

        print getopts(ARGV[2], list)
	exit 0
    }

    usage()
    exit 2
}


# --- pmatch ---------------------------------------------------------------
#
# Match a pattern against a package version
#
function pmatch(target, pkg,	a, t, r, version, pattern, cur, ver, m, malt,
				opts, reqd, strict)
{
    if (match(target, /{/)) {
        wonderbrace(pattern, target)
        for (a = 1; a <= pattern[0]; a++) {
            if (pmatch(pattern[a], pkg)) return 1
        }
        return 0
    }

    vextract(version, pkg)
    if (version[2] != "==") return 0
    mkversion(ver, version[3])
    split(version[4], opts, /[,+]+/)

    while(target) {
        target = pextract(pattern, target)
        m = glob2ere(pattern[1])
        malt = glob2ere(pattern[1] "-[0-9]*")
        t = tests[pattern[2]]

        if (4 in pattern) {
            split(pattern[4], reqd, /[,+]+/)
            if (!matchoptions(reqd, opts, 0))
                return 0
        }

        if (pattern[3]) {
            mkversion(cur, pattern[3])
            if (!vtest(ver, t, cur)) return 0
        }

        if (version[3]) {
            if (!match(version[1] "-" version[3], m) &&
                !match(version[1] "-" version[3], malt))
                return 0
        } else {
            if (!match(version[1], m) && !match(version[1], malt))
                return 0
	}
    }

    return 1
}


# --- reduce ---------------------------------------------------------------
#
# Distill a version requirement list into a single interval that statisfies all
# the versions requirements. '!=' tests are put apart (they do not make an
# interval).
#
function reduce(targets,	a, i, k, t, p, name, min, minop, max, maxop,
				ne, cur, r, s, opts, nopts, sopts)
{
    for(a in targets) {
	while(targets[a]) {
	    targets[a] = pextract(pattern, targets[a])
	    if (pattern[1]) r = pattern[1]
	    k = name[r]++
	    p[r,"t",k] = pattern[2]
	    p[r,"v",k] = pattern[3]
	    if (4 in pattern) p[r,"o",k] = pattern[4]
	}
    }

    for(a in name) {
        for(r in name) {
            if (r == a) continue
            t = glob2ere(r)
            if (a ~ t) {
                for(k=0; k<name[r]; k++) {
                    p[a,"t",k+name[a]] = p[r,"t",k]
                    p[a,"v",k+name[a]] = p[r,"v",k]
                    if ((r,"o",k) in p) p[a,"o",k+name[a]] = p[r,"o",k]
                }
                name[a] += name[r]
                delete name[r]
            }
        }
    }

    r = ""
    for(a in name) {
	minop = maxop = 0; ne = "";
        split("", opts); split("", nopts);

	for(k=0; k<name[a]; k++) {
	    t = tests[p[a,"t",k]]

            # options
            if ((a,"o",k) in p)
                if (!mergeoptions(opts, nopts, p[a,"o",k]))
                    return ""

            # version
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

        sopts = ""
        for(s in opts) {
            if (sopts) sopts = sopts "+"
            sopts = sopts s
        }
        for(s in nopts) {
            if (sopts) sopts = sopts "+"
            sopts = sopts "!" s
        }

	if (minop && maxop && maxop != minop) {
	    if (!vtest(max, minop, min) || !vtest(min, maxop, max)) return ""
	}

	if (r) r = r " "
	if (a) r = r a
	if (minop) r = r strop(minop) min[-2]
	if (maxop && maxop != minop) r = r strop(maxop) max[-2]
        if (sopts) r = r "~" sopts
	if (r && ne) r = r " "
	if (ne) r = r a "!=" ne
    }
    sub(/^ +/, "", r)
    sub(/ +$/, "", r)
    return r
}


# --- opts -----------------------------------------------------------------
#
# Distill a version requirement list into the list of options that it implies.
# This is, in general, a NP complete problem (SAT) but we have here a very
# specific problem that let us do some simplifications.
#
function getopts(target, list,	a, i, r, l, o, p, n, opts, nopts)
{
    while(target) {
        target = pextract(pattern, target)
        if (!mergeoptions(opts, nopts, pattern[4]))
            return ""
    }

    # consider non-pattern options first
    for (i in list) {
        if (list[i] in opts) {
            if (list[i] in nopts) return ""
            p[list[i]]; delete opts[list[i]]; delete list[i]
        } else if (list[i] in nopts) {
            n[list[i]]; delete nopts[list[i]]; delete list[i]
        }
    }

    # add option matching patterns
    for(o in nopts) {
        o = glob2ere(o)
        for (i in list)
            if (list[i] ~ o) {
                n[list[i]]; delete list[i]
            }
    }
    for(o in opts) {
        o = glob2ere(o)
        if ("" ~ o) continue
        for (i in list)
            if (list[i] ~ o) {
                p[list[i]]; delete list[i]
                break
            }
    }

    # format output
    for (i in p) r = r " " i
    for (i in n) r = r " -" i
    sub(/^ +/, "", r)
    return r
}


# --- mergeoptions ---------------------------------------------------------
#
# Store the options str in the array opts/nopts.
# BUGS: This is only a poor approximation of a real "and".
# Return 1 on success, 0 otherwise
#
function mergeoptions(opts, nopts, str,	i, j, n, s, neg, o, p, m) {
    n = split(str, o, /[,+]+/)
    for(p in opts) {
        if (p ~ /[[?*]/) continue
        for(i=1; i<=n; i++) {
            if (o[i] !~ /^!/) continue
            if (p ~ glob2ere(substr(o[i],2))) return 0
        }
    }

    for(i=1; i<=n; i++) {
        if (o[i] ~ /^!/) continue
        if (o[i] in opts && o[i] !~ /[[?*]/) continue
        for(p in opts) if (o[i] ~ glob2ere(p)) continue
        for(p in nopts) if (o[i] ~ glob2ere(p)) return 0
    }

    for(i=1; i<=n; i++) {
        s = substr(o[i], 1 + (neg = (o[i] ~ /^!/)))
        if (neg) nopts[s]; else opts[s];
    }

    return 1;
}


# --- matchoptions ---------------------------------------------------------
#
# Check options in pkg match pattern reqd.
# Return 1 on success, 0 otherwise
#
# The matching is done according to the following algorithm ("equal" mean
# strcmp, "match" mean fnmatch):
# - one positive option in reqd matches no option in pkg -> fail.
# - one negative option in reqd equal one option in pkg -> fail.
# - one option in pkg equal no positive option in reqd
#   if the option matches a negative option in reqd -> fail.
#     if !strict -> success.
#     if the option matches no positive wildcard option in reqd
#       -> fail.
# - -> success.
#
function matchoptions(reqd, pkg, strict,	r, p, m, neg, o, t) {
    # for each option in pattern
    for (r in reqd) {
        t = glob2ere(substr(reqd[r], 1 + (neg = (reqd[r] ~ /^!/))))

        # test option match in pkg
        if (!neg && "" ~ t) continue
        m = 0
        for (p in pkg) {
            if (neg && pkg[p] == t) return 0
            if (!neg && pkg[p] ~ t) { m = 1; break }
        }
        if (!neg && !m) return 0
    }

    # for each option in pkg
    for (p in pkg) {
        # test positive equality in pattern
        m = 0
        for (r in reqd) {
            if (reqd[r] ~ /^!/) continue
            if (pkg[p] == reqd[r]) { m = 1; break }
        }
        if (m) continue

        # test match in pattern
        m = 0
        for (r in reqd) {
            t = glob2ere(substr(reqd[r], 1 + (neg = (reqd[r] ~ /^!/))))
            if (neg && pkg[p] ~ t) return 0
            if (!neg && !m && pkg[p] ~ t) m = 1
        }
        if (strict && !m) return 0
    }

    return 1;
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
    split("", ap) # clean array
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
# extract name[1], test[2], version[3] and options[4]
#
function pextract(pattern, str)
{
    while(match(str, /^[ \t]+/))
	str = substr(str, RLENGTH+1)

    split("", pattern) # clean array

    if (match(str, /^[^ \t]*([><]=?|[=!]=)/)) {
        match(str, /([><]=?|[=!]=)/)
	pattern[1] = substr(str, 1, RSTART-1)
	pattern[2] = substr(str, RSTART, RLENGTH)
	str = substr(str, RSTART+RLENGTH)
	if (match(str, /([ \t]|[><]=?|[=!]=)/)) {
	    pattern[3] = substr(str, 1, RSTART-1)
	    str = substr(str, RSTART)
	} else {
	    pattern[3] = str
	    str = ""
	}
        if (match(pattern[3], /~[^~]*$/)) {
	    pattern[4] = substr(pattern[3], RSTART+1)
	    pattern[3] = substr(pattern[3], 1, RSTART-1)
        }
	return str
    }

    if(match(str, /[ \t]/)) {
        pattern[1] = substr(str, 1, RSTART-1)
	str = substr(str, RSTART)
    } else {
        pattern[1] = str
        str = ""
    }

    if (match(pattern[1], /~[^~]*$/)) {
        pattern[4] = substr(pattern[1], RSTART+1)
        pattern[1] = substr(pattern[1], 1, RSTART-1)
    }

    return str
}


# --- vextract -------------------------------------------------------------
#
# extract name[1], version[3] and options[4]
#
function vextract(pattern, str)
{
    while(match(str, /^[ \t]+/))
	str = substr(str, RLENGTH+1)

    split("", pattern) # clean array

    pattern[2] = "=="
    if (match(str, /~[^~]*$/)) {
        pattern[4] = substr(str, RSTART+1)
        str = substr(str, 1, RSTART-1)
    }
    if (match(str, /-[0-9][^-]*$/)) {
	pattern[1] = substr(str, 1, RSTART-1)
	pattern[3] = substr(str, RSTART+1)
    } else {
	pattern[1] = str
    }
}


# --- wonderbrace ----------------------------------------------------------
#
# Expand {,} alternatives
#
function wonderbrace(alts, str,
                     start, end, paren, alt, nalt, prefix, suffix,
                     i, c, r, l) {
    if (!match(str, /{/)) { alts[++alts[0]] = str; return }

    start = end = RSTART
    paren = 1
    l = length(str)
    for(i=start+1; i<=l; i++) {
        c = substr(str, i, 1)
        if (c == "{")  { ++paren; continue }
        if (paren > 1) { if (c == "}") paren--; continue }
        if (c == "," || c == "}")  {
            alt[nalt++] = substr(str, end+1, i-end-1)
            end = i;
            if (c == "}") break; else continue
        }
    }
    # if no correct braces were found, return the initial string
    if (c != "}" || paren != 1) { alts[++alts[0]] = str; return }

    prefix = substr(str, 1, start-1)
    suffix = substr(str, end+1)

    for(i=0; i<nalt; i++) {
        wonderbrace(alts, prefix alt[i] suffix)
    }
}


# --- glob2ere -------------------------------------------------------------
#
# The current version of this library can be found by searching
# http://www.armory.com/~ftp/
#
# @(#) glob2ere 1.0 2002-01-18
# 2002-01-18 john h. dubois iii (john@armory.com)
#
# Roughly translate an sh-style globbing expression to an awk-style regular
# expression.
# ^$()+|.{} are escaped with \
# ?, *, and [] are translated to ., .*, and [] if not escaped with \
# If a \ precedes ? * [] it is left in place; all other \ are removed
# A ! immediately after an unescaped [ is translated to ^
# A [ inside [] is taken literally
# A ] that occurs immediately after an opening [ or [! is taken literally
# The expression is anchored at the start and end with ^ and $
# An sh pattern that has a [ without a matching ] does not matching anything.
# Any pattern that includes it will result in a return value of the special
# string ".^", which will not match anything but can also be treated as an
# error.
function glob2ere(globex,

	cpos, len, re, c, inbrack, lastesc, lastbrack, newlastbrack,
	newlastnot, lastnot) {
    # State variables:
    # lastesc: Last character was a \
    # lastbrack: Last character was a [
    # lastnot: Last character was a ! that followed a [
    # inbrack: We have seen a [ but not yet a ]
    len = length(globex)
    for (cpos = 1; cpos <= len; cpos++) {
	c = substr(globex,cpos,1)
	# The "new" versions of these variables are used so that the values are
	# cleared after one iteration.
	newlastbrack = newlastnot = 0
	if (lastesc) {
	    if (index("?*[]",c))
		c = "\\" c
	    lastesc = 0
	}
	else if ((lastbrack || lastnot) && c == "]")
            # last char was [, or ! after [
	    # ] immediately after [ or [! becomes part of the list;
	    # ] later after [ closes the [
	    ;
	else if (lastbrack && c == "!") {
	    # ! immediately after [
	    c = "^"
	    newlastnot = 1
	}
	else if (index("^$()+|.{}",c))
	    c = "\\" c
	else if (c == "\\") {
	    lastesc = 1
	    c = ""
	}
	else if (inbrack) {	# do not treat ?*[ specially inside []
	    if (c == "]")
		inbrack = 0
	}
	else if (c == "?")
	    c = "."
	else if (c == "*")
	    c = ".*"
	else if (c == "[")
	    inbrack = newlastbrack = 1
	re = re c
	lastbrack = newlastbrack
	lastnot = newlastnot
    }
    if (inbrack)
	return ".^"
    else
	return "^" re "$"
}
