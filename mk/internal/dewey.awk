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
