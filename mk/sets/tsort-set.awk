#!/usr/bin/awk -f
#
# Copyright (c) 2010-2011,2013 LAAS/CNRS
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
    COLUMNS = ENVIRON["COLUMNS"]?ENVIRON["COLUMNS"]:79
    MAKE = ENVIRON["MAKE"]?ENVIRON["MAKE"]:"make"
    TPUT = ENVIRON["TPUT"]?ENVIRON["TPUT"]:"tput"
    ROBOTPKG_DIR =\
	ENVIRON["ROBOTPKG_DIR"]?ENVIRON["ROBOTPKG_DIR"]:"/opt/openrobots"

    order = 1
    sort = 1
    strict = 0
    pathonly = 0
    noconflict = 0
    interactive = 0
    eta = 0
    troot = "ø"

    ARGSTART = 1
    while (ARGSTART < ARGC) {
	option = ARGV[ARGSTART]
	if (option == "--") {
	    ARGSTART++
	    break
	} else if (option == "-1") {
	    noconflict = 1
	    ARGSTART++
	} else if (option == "-r") {
	    order = -1
	    ARGSTART++
	} else if (option == "-s") {
	    strict = 1
	    ARGSTART++
	} else if (option == "-n") {
	    sort = 0
	    ARGSTART++
	} else if (option == "-p") {
	    pathonly = 1
	    ARGSTART++
	} else if (option == "-i") {
	    interactive = 1
	    ARGSTART++
	} else if (option == "-e") {
	    eta = 1
	    ARGSTART++
	} else if (option == "-d") {
	    ROBOTPKG_DIR = ARGV[ARGSTART + 1]
	    ARGSTART+= 2
	} else if (match(option, /^-.*/) != 0) {
	    option = substr(option, RSTART + 1, RLENGTH)
	    xprint("***:" ARGV[0] ": unknown option -- ")
	    usage()
	    exit 1
	} else break
    }

    # set fancy stuff for -i - noop otherwise (blank)
    verbose = sort
    if (verbose && interactive) {
        cmd = TPUT " cuu1"; cmd | getline cuu; close(cmd)
        cmd = TPUT " sc"; cmd | getline sc; close(cmd)
        cmd = TPUT " rc"; cmd | getline rc; close(cmd)
        cmd = TPUT " ed || " TPUT " cd"; cmd | getline el; close(cmd)
    }

    # get input, either on cmdline or on stdin
    if (ARGC <= ARGSTART) {
	while (getline pkg < "-") cmdline[++cmdline[0]] = pkg
    } else {
	while (ARGC > ARGSTART) {
	    ARGC--
            n = split(ARGV[ARGC],args)
            for(i=1;i<=n;i++) cmdline[++cmdline[0]] = args[i]
	}
    }

    # input must be cat/dir[:pkg[~opts]]
    n = 0
    for(i=1; i<=cmdline[0]; i++) {
        if (cmdline[i] !~ /^[^\/:~]+\/[^\/:~]+(:[^:]*(~[^~]*)?)?$/) {
            xprint("***:Malformed set element " cmdline[i])
            n++
        }
    }
    if (n) exit 2

    # expand paths
    for(i=1; i<=cmdline[0]; i++)
        xpaths(dirs, pdir(cmdline[i]), ".")

    # expand pkgs and options
    for(d in dirs) {
        split("", patterns)
        for(i=1; i<=cmdline[0]; i++) # filter patterns for d, keep order
            if (d ~ glob2ere(pdir(cmdline[i]))) {
                patterns[++patterns[0]] = notpdir(cmdline[i])
            }
        if (patterns[0] < 1) continue
        xpkgs(patterns, d)
    }

    # scan
    if (stack[0] == 0) {
        xwarn("Scanned no package")
        exit 0
    }
    depgraph()
    xwarn("Scanned " stackdone " packages")
    if (sort) pkgtsort()
}


# --- usage ----------------------------------------------------------------
#
function usage() {
    print "usage: " ARGV[0]						\
	" [-- [-1] [-r] [-s] [-n] [-p] [-i] [-e]"			\
        " [-d robotpkgdir]] [pkgpath ...]"                              \
        > "/dev/stderr"
}


# --- depgraph -------------------------------------------------------------
#
# Compute the dependency graph of packages.
#
function depgraph(		deps, d) {
    while (stack[0] > 0) {
        pkg = stack[stack[0]]
        delete stack[stack[0]--]
	if (pkg in done) continue

	if (!strict ||
            (pdir(pkg),troot) in graph || (troot,pdir(pkg)) in graph) {
            pkginfos(pkg, deps)
            for(d in deps) pkgpush(pkg, d)
	}

        done[pkg]
        stackdone++
        if (!sort) xprintpkg(pkg)
    }
}


# --- pkgtsort -------------------------------------------------------------
#
# Sort package graph. See tsort(1).
#
function pkgtsort(	k, todo, dir) {
    stackdone = 0
    todo = 1
    while (todo) {
        todo = 0
        for (dir in graphcnt) {
            if (graphcnt[dir] > 0) continue
            todo = 1
            if (dir == troot) {
                graphdel(dir)
                continue
            }
            if (!strict || (dir,troot) in graph || (troot,dir) in graph) {
                if (pathonly) {
                    xprint(dir)
                    stackdone+=pkgreqd[dir]
                } else
                    for(k = 1; k<=pkgreqd[dir]; k++) {
                        xprintpkg(dir ":" pkgreqd[dir,k])
                        stackdone++
                    }
            }
            graphdel(dir)
        }
        if (todo) continue

        for (dir in graphcnt) {
            xwarn("ERROR: cycle around " dir " " graph[dir])
            todo = 1
            graphdel(dir)
            break
        }
    }
}


# --- pkgpush --------------------------------------------------------------
#
# Register a dependency dep for a package pkg, and push new packages
# If uniquep, don't try to reduce dependencies after rank #n (optimization for
# patterns like ~* added at startup, since reduction is O(n²) and we know that
# elements from the expansion are already unique)
#
function pkgpush(pkg, dep, uniquep, n,		i, k, r, depdir, deppat,
						pkgdir, p, q, rdep) {
    pkgdir = pdir(pkg)
    if ((pkgdir,dep) in donedep) return
    donedep[pkgdir,dep]

    depdir = pdir(dep)
    deppat = notpdir(dep)

    # add edge/children count in dependency graph
    if (order > 0) graphadd(pkgdir, depdir); else graphadd(depdir, pkgdir)

    # reduce dependencies
    if (!deppat && pkgreqd[depdir]>0) return
    for(k=1; k<=(uniquep?n:pkgreqd[depdir]); k++) {
        if (pkgreqd[depdir,k] == deppat) return

        if (pkgreqd[depdir,k]) {
            r[0] = pkgreqd[depdir,k]
            r[1] = deppat
            rdep = reduce(r)
            if (!rdep || rdep ~ / /) continue
            if (pkgreqd[depdir,k] == rdep) return

            # reduction must be a valid package name
            if (!(depdir in pkgnames)) q = pkginfos(depdir ":" rdep, r, 1)
            for (i=1; i<=pkgnames[depdir]; i++) {
                if (pmatch(rdep, pkgnames[depdir,i])) break
            }
            if (i>pkgnames[depdir]) continue
        } else
            rdep = deppat

        # already seen, but needs update: mark old one as done already,
        # since doing the new one will do both.
        if (!(depdir ":" pkgreqd[depdir,k] in done)) {
            done[depdir ":" pkgreqd[depdir,k]]
            stackdone++
        }
        pkgreqd[depdir,k] = rdep
        stack[++stack[0]] = depdir ":" rdep
        stacktodo++

        if (depdir ":" rdep in done) return
        # optimize if the pkginfo above was for us
        if (q && pmatch(rdep, q, 0)) {
            if (!sort) xprintpkg(depdir ":" rdep)
            done[depdir ":" rdep]
            stackdone++
            for(i in r) pkgpush(depdir ":" rdep, i)
        }
        return
    }

    # store new dependency
    pkgreqd[depdir,++pkgreqd[depdir]] = deppat
    stack[++stack[0]] = dep
    stacktodo++

    if (noconflict && pkgreqd[depdir] > 1) {
        q = deppat
        gsub(/~[^~]*$/,"", q)
        for (i=1; i<pkgreqd[depdir]; i++) {
            p = pkgreqd[depdir,i]
            gsub(/~[^~]*$/,"", p)
            if (p == q) {
                xprint("***:" pkgreqd[depdir,i] " is incompatible with " deppat)
                if (pkg != troot) xprint("***:" deppat " is required by " pkg)
                exit 2
            }
        }
    }
}


# --- graphadd -------------------------------------------------------------
#
# Add a package directory to the dependency graph
#
function graphadd(dir, depdir) {
    if (!((depdir,dir) in graph)) {
        graph[depdir] = graph[depdir] " " dir
        graph[depdir,dir]
        graphcnt[depdir]
        graphcnt[dir]++
    }
}


# --- graphdel ---------------------------------------------------------------
#
# Remove a package directory from the dependency graph
#
function graphdel(dir,	i, plist) {
    if (graphcnt[dir] <= 0) delete graphcnt[dir]

    for (i = split(graph[dir], plist); i>0; i--) {
        graphcnt[plist[i]]--
        # do not delete graph[troot,plist[i]], required for "-r -s" mode
        if (dir != troot) delete graph[dir,plist[i]]
    }
    delete graph[dir]
}


# --- pkginfos -------------------------------------------------------------
#
# Query package information: pkgnames, depends-pkgpaths
#
function pkginfos(pkg, deps, pkgnamep,		cmd, dir, i, l, s) {
    split("", deps)
    dir = pdir(pkg)

    xlog("Scanning " pkg)

    cmd = "cd " ROBOTPKG_DIR "/" dir "&&" MAKE " PKGREQD='" notpdir(pkg) "'"
    cmd = cmd " print-depends-pkgpaths 2>&1"
    if (pkgnamep) cmd = cmd  " print-var VARNAME=PKGNAME"
    if (!(dir in pkgnames)) cmd = cmd  " print-pkgnames"

    while ((cmd | getline l) > 0) {
        split(l, i, "|")
        if (i[1] == "PKGNAME") {
            pkgnamep = i[2]
        } else if (i[1] == "print-pkgnames") {
            pkgnames[dir,++pkgnames[dir]] = i[2]
        } else if (i[1] == "print-depends-pkgpaths") {
            if (!((dir,i[2]) in donedep)) deps[i[2]]
        } else
            xwarn("[" pkg "] " l)
    }
    s = close(cmd)
    if (s) { xprint("***:Fatal error while scanning " pkg); exit 2 }
    if (pkgnamep) return pkgnamep
}


# --- xpath ----------------------------------------------------------------
#
# Expand glob characters in path pattern
#
function xpaths(xpath, pattern, path,	subdir, d, dir, s, p) {
    if (match(pattern, /\//)) {
        subdir = substr(pattern, RSTART+1)
        pattern = substr(pattern, 1, RSTART-1)
    }

    if (pattern ~ /[[*?]/) {
        p = glob2ere(pattern)
        split(subdirs(path), dir)
        for (d in dir) if (dir[d] ~ p) xpath[dir[d]]
    } else
        if (subdir || pkgexists(path "/" pattern)) xpath[pattern]

    if (!subdir) return

    for(s in xpath) {
        if (xpath[s]) continue
        delete xpath[s]
        split("", dir)
        xpaths(dir, subdir, path "/" s)
        for (d in dir) xpath[s "/" d] = 1
    }
}


# --- xpkg -----------------------------------------------------------------
#
# Expand glob characters in a package pattern
#
function xpkgs(patterns, path,		pattern, deps, xopts, wopts,
					f, n, d, p, q, i, k) {
    # expand pkgbase, choose first pattern that generates a match
    q = pkginfos(path ":" patterns[1], deps, 1)

    f = 0
    for (k = 1; k <= patterns[0]; k++) {
        for (i = 1; i <= pkgnames[path]; i++) {
            if (pmatch(patterns[k], pkgnames[path,i], 0)) {
                pattern = patterns[k]
                f = 1
                break
            }
        }
        if (f) break
    }
    if (!f) return

    # no expansion required
    if (pattern !~ /[[*?{]/) {
        pkgpush(troot, path ":" pattern)

        # optimize if the pkginfo above was for us
        if (path ":" pattern in done) return
        if (pmatch(pattern, q, 0)) {
            if (!sort) xprintpkg(path ":" pattern)

            done[path ":" pattern]
            for(k = stack[0]; k>0; k--)
                if (path ":" pattern == stack[k]) { stackdone++; break; }

            for(d in deps) pkgpush(path ":" pattern, d)
        }
        return
    }

    # expand pkgbase and options
    wopts = pattern ~ /~[^~]*$/
    xopts = pattern ~ /~.*[[*?{]/
    n = pkgreqd[path]
    for (; i <= pkgnames[path]; i++) { # beware: reuse 'i' from above loop
        p = pkgnames[path,i]
        if (!wopts) sub(/~[^~]*$/, "", p)
        if (!pmatch(pattern, p, 0)) continue

        if (xopts) {
            if (p !~ /~/) p = p "~!*"; else p = p "+!*"
        }
        pkgpush(troot, path ":" p, 1, n)

        # optimize: if the pkginfo above was for us, stack deps directly to
        # avoid another query later (saves ~50% time on dir:* patterns)
        if (!(path ":" p in done)) {
            if (pmatch(p, q, wopts)) {
                if (!sort) xprintpkg(path ":" p)

                done[path ":" p]
                for(k = stack[0]; k>0; k--)
                    if (path ":" p == stack[k]) { stackdone++; break; }

                for(d in deps) pkgpush(path ":" p, d)
            }
        }

        if (wopts && !xopts) break
    }
}


# --- subdirs --------------------------------------------------------------
#
# Retrieve subdirs for a path relative to ROBOTPKG_DIR
#
function subdirs(path,		cmd, d) {
    if (subdir[path]) return subdir[path]

    cmd = "cd " ROBOTPKG_DIR "/" path " && " MAKE " show-subdir"
    while (cmd | getline d) {
        subdir[path] = subdir[path] " " d
    }
    if (close(cmd)) {
        print "Unable to process " path > "/dev/stderr"
        return ""
    }

    return subdir[path]
}


# --- pkgexists, dir, notdir -----------------------------------------------
#
# Helper functions that deal with existence or dir name / pattern extraction
# for a dir:pattern package specification
#
function pkgexists(path,		d) {
    return ((getline d < (ROBOTPKG_DIR "/" path "/Makefile")) <0) ? 0 : 1
}

function pdir(pkg,		i) {
    i = index(pkg, ":")
    return i ? substr(pkg, 1, i-1) : pkg
}

function notpdir(pkg,		i) {
    i = index(pkg, ":")
    return i ? substr(pkg, i+1) : ""
}


# --- xprint, xlog ---------------------------------------------------------
#
# Write to stdout: xprint for regular output, xlog for status messages, xwarn
# for unexpected output of make subprocesses.
#
function xprint(msg) {
    if (xlogged > 0) print ":" el cuu
    print msg
    xlogged = 0
}

function xprintpkg(pkg,		dir) {
    dir = pdir(pkg)
    if (!strict || (dir,troot) in graph || (troot,dir) in graph) {
        if (eta && stacktodo > 0)
            xwarn("[" int((100*stackdone)/stacktodo) "%] Processing " pkg)
        xprint(pkg)
    }
}

function xlog(msg) {
    if (verbose && interactive) {
        if (stacktodo > 0)
            msg = "[" int((100*stackdone)/stacktodo) "%] " msg
        print ":" sc substr(msg,1,COLUMNS) el rc cuu
        xlogged++
    } else if (verbose)
        print ":" msg
}

function xwarn(msg) {
    print ":" msg el
    xlogged = 0
}
