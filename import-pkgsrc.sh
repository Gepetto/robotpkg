#!/bin/sh

if test $# -lt 1; then
  echo 'usage: $0 <module> [<date>]'
  exit 2;
fi

# cvs definitions
netbsd_root=anoncvs@anoncvs.netbsd.org:/cvsroot
pkgsrc_repo=pkgsrc
module=$1; shift
case $module in
  pkgtools/pkg_install)	pkgsrc_module=pkgtools/pkg_install/files;;
  net/libfetch)		pkgsrc_module=net/libfetch/files;;
  *) echo 'no such module "$module"'; exit 2;;
esac

# find robotpkg tree
root=`git rev-parse --show-toplevel`
test -n "$root" || exit 2
echo going to $root/$module
cd $root/$module || exit 2

# clean 'dist'
if test -d dist; then
  echo backing up existing dist in dist.backup
  if test -d dist.backup; then
    echo 'dist.backup is in the way: please remove it'
    exit 2
  fi
  mv dist dist.backup
fi

# use any date given
if test $# -gt 0; then
  echo using $1 as the export date
  date="-D $1"
else
  echo 'using HEAD - use $0 <module> <date>' to overwrite
  date="-r HEAD"
fi

# go
cmd="cvs -d $netbsd_root export $date -d dist $pkgsrc_repo/$pkgsrc_module"
echo $cmd
$cmd
