#!/bin/sh
#
# Copyright (c) 2011 LAAS/CNRS
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
#                                            Anthony Mallet on Fri Sep  9 2011
#
: ${UNAME:=uname}

read s r m <<EOF
`$UNAME -srm`
EOF

case $m in
    sun4*|sparc*)	m=sparc;;
    i[3456]86*)		m=i386;;
esac
case $s in
    Darwin)
        s=MacOSX
        case $r in
            9.*) r=10.5;;
            10.*) r=10.6;;
            11.*) r=10.7;;
        esac
        case $r in
            10.[6789]*)
                if test "`/usr/sbin/sysctl -n hw.optional.x86_64`" = "1"; then
                    m=x86_64
                fi
                ;;
        esac
        ;;
    Linux)
        if test -f /etc/redhat-release; then
            read distrib dummy release tail </etc/redhat-release
            if test "$dummy" = "release"; then
                echo $distrib $release $m
                exit 0
            fi
        fi
        if test -f /etc/lsb-release; then
            found=
            while IFS== read key value; do
                if test "$key" = "DISTRIB_ID"; then
                    s=$value
                    found=$found"x"
                elif test "$key" = "DISTRIB_RELEASE"; then
                    r=$value
                    found=$found"x"
                fi
                if test "$found" = "xx"; then
                    echo $s $r $m
                    exit 0
                fi
            done </etc/lsb-release
        fi
        if test -f /etc/debian_version; then
            read release </etc/debian_version
            echo Debian $release $m
            exit 0
        fi
        ;;
    SunOS)
        case $r in
            5*) s=Solaris;;
        esac
        ;;
esac
echo $s $r $m
exit 0
