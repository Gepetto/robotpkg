# interfaces/ros2-rosidl/files/plist-generator.mk
#                                           Anthony Mallet on Thu Aug 17 2023
#

# --- Handle PLIST for file generators -------------------------------------
#
# The script can be invoked with 'expand' or 'collapse' as its sole argument.
#
# It acts as a PLIST or PRINT_PLIST filter by scanning through stdin and
# producing the filtered output on stdout according generators rules.
# . In 'expand' mode, it outputs all input files as well as generated files;
# . In 'collapse' mode, it filters out those generated files from input.
#
# This script is not standalone (it's a noop as such) and need further code
# input by generator via PLIST_GENERATORS set by individual packages.
#
function usage()
{
    print "Usage:"
    print "	" ARGV[0] " -v generators=... expand"
    print "	" ARGV[0] " -v generators=... collapse"
}


BEGIN {
    # check arguments
    if (ARGC != 2) { usage(); exit 2; }

    if (ARGV[1] == "expand") expand = 1
    else if (ARGV[1] == "collapse") collapse = 1
    else { usage(); exit 2; }

    split(generators, genlist)

    # force stdin scanning
    ARGV[1] = "-"

    # dealing mostly with filenames, split input at `/' or `.'
    FS="[./]"; OFS="/"; SUBSEP="/"
}

# default actions
expand { print }
collapse { plist[$0] }

# Filter PLIST
END {
    if (collapse) for(f in generated) delete plist[f]
    for(f in plist) print f
    if (expand) for(f in generated) print f
}


# --- generator ------------------------------------------------------------
#
# Test if a given generator requirement matches target.
#
function generator(target,	g)
{
    # same tests will be done for each input file, so caching helps a bit
    if (target in gcache_) return gcache_[target]

    for (g in genlist)
        if (pmatch(target, genlist[g])) return gcache_[target] = 1
    return gcache_[target] = 0
}


# --- decamel --------------------------------------------------------------
#
# Convert CamelCase to snake_case with ros idea of this task
#
function decamel(str)
{
    while(match(str, /[^_][A-Z][a-z0-9]/))
        str = substr(str, 1, RSTART) "_" substr(str, RSTART+1)
    while(match(str, /[a-z0-9][A-Z]/))
        str = substr(str, 1, RSTART) "_" substr(str, RSTART+1)
    return tolower(str)
}
