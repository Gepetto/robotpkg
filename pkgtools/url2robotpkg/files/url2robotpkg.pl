#! @PERL@
# $NetBSD: url2pkg.pl,v 1.10 2007/09/25 13:59:42 wiz Exp $
#

use strict;
use warnings;
use POSIX qw(strftime);

#
# Build-time Configuration.
#

my $make		= '@MAKE@';

use constant true	=> 1;
use constant false	=> 0;

#
# Some helper subroutines.
#

sub run_editor($$) {
  my ($fname, $lineno) = @_;

  my $editor = $ENV{"PKGEDITOR"} || $ENV{"EDITOR"} || "vi";

  system join(" ", ($editor, "+${lineno}", $fname));
}

sub get_maintainer() {

  return $ENV{"PKGMAINTAINER"} || $ENV{"REPLYTO"} || 'openrobots@laas.fr';
}

sub print_section($$) {
  my ($f, $vars) = @_;

  if (scalar(@{$vars}) == 0) {
    return;
  }

  my $width = 0;
  foreach my $var (@{$vars}) {
    my $len = length($var->[0]);
    $width = ($len > $width) ? $len : $width;
  }

  foreach my $var (@{$vars}) {
    my $len = length($var->[0]) + 1;
    my $adjlen = (($width + 1 + 1) + 7) &-8;
    my $ntabs = (7 + $adjlen - $len) / 8;
    printf $f ("%s=%s%s\n", $var->[0], "\t" x $ntabs, $var->[1]);
  }
  printf $f ("\n");
}

#
# Introduction to the magic_* subroutines.
#
# The following routines are called after the distfiles have been
# downloaded and extracted. They may inspect the extracted files
# to automatically define some variables in the package Makefile.
#
# The following variables may be used in the magic_* subroutines:
# $distname contains the package name, including the version number.
# $abs_wrkdir is an absolute pathname to the working directory, which
# contains the extracted distfiles. $abs_wrksrc is the absolute pathname
# to a subdirectory of $abs_wrkdir, in which you can usually find the
# package-provided Makefiles or configure scripts.
#
# The following lists may be extended by the magic_* routines and
# will later appear in the package Makefile: @depends and @build_depends
# contain the dependencies of the package, in the form
# "package>=version". @includes is a list of pathnames relative to the
# package path. All these files will be included at the bottom of the
# Makefile. @build_vars is a list of [varname, value] items that contain
# variables that will be defined in the fourth paragraph of the package
# Makefile, where the build configuration takes place. The @extra_vars
# are similar to the @build_vars, but separated by an empty line in the
# Makefile. The @todo items are inserted below the second paragraph in
# the Makefile.
#

my ($distname, $abs_wrkdir, $abs_wrksrc);
my (@wrksrc_files, @wrksrc_dirs);
my (@depends, @build_depends, @includes, @build_vars, @extra_vars, @todo);
my ($pkgname);

#
# And now to the real magic_* subroutines.
#

sub magic_configure() {
  my $gnu_configure = false;

  open(CONF, "<", "${abs_wrksrc}/configure") or return;
  while (defined(my $line = <CONF>)) {
    if ($line =~ qr"autoconf|Free Software Foundation"i) {
      $gnu_configure = true;
      last;
    }
  }
  close(CONF);

  my $varname = ($gnu_configure ? "GNU_CONFIGURE" : "HAS_CONFIGURE");
  push(@build_vars, [$varname, "yes"]);
}

sub magic_cmake() {
  my @cmake_files = grep { /~CMakeLists.txt$/ } @wrksrc_files;
  if (@cmake_files) {
    push(@includes, "../../mk/sysdep/cmake.mk");
  }
}

sub magic_libtool() {
  if (-f "${abs_wrksrc}/ltconfig" || -f "${abs_wrksrc}/ltmain.sh") {
    push(@includes, "../../pkgtools/libtool/depend.mk");
  }
}

sub magic_pkg_config() {
  my @pkg_config_files = grep { /\.pc\.in$/ && ! /-uninstalled\.pc\.in$/ } @wrksrc_files;
  if (@pkg_config_files) {
    push(@includes, "../../pkgtools/pkg-config/depend.mk");
  }
}

sub magic_genom() {
  my @genom_files = grep { /\.gen$/ } @wrksrc_files;
  if (@genom_files) {
    push(@includes, "../../architecture/genom/depend.mk");
    push(@build_vars, ['GNU_CONFIGURE', 'yes']);

    foreach my $gen (@genom_files) {
      $gen =~ s/.gen$//;
      push(@build_vars, ['GENOM_MODULE', $gen]);
    }
  }
}

sub magic_use_languages() {
  my @languages;

  grep(/\.(c|xs)$/, @wrksrc_files) and push(@languages, "c");
  grep(/\.(cpp|c\+\+|cxx|cc|C)$/, @wrksrc_files) and push(@languages, "c++");
  grep(/\.f$/, @wrksrc_files) and push(@languages, "fortran");

  my $use_languages = join(" ", @languages);
  if ($use_languages eq "") {
    $use_languages = "# none";
  }
  if ($use_languages ne "c") {
    push(@build_vars, ["USE_LANGUAGES", $use_languages]);
  }
}

#
# Subroutines for generating the initial package and adjusting it after
# the distfiles have been extracted.
#

sub generate_initial_package($) {
  my ($url) = @_;
  my ($found, $master_site);
  my ($master_sites, $distfile, $homepage, $dist_sufx, $category);
  my ($gcos, $date, $year);

  $found = false;
  open(SITES, "<", "../../mk/fetch/sites.mk") or die;
  while (defined(my $line = <SITES>)) {
    chomp($line);

    if ($line =~ qr"^(MASTER_SITE_.*)\+=") {
      $master_site = $1;

    } elsif ($line =~ qr"^\t(.*?)(?:\s+\\)$") {
      my ($site) = ($1);

      if (index($url, $site) == 0) {
	$found = true;

	if ($url =~ qr"^\Q${site}\E(.+)/([^/]+)$") {
	  my $subdir = $1;
	  $distfile = $2;

	  $master_sites = "\${${master_site}:=${subdir}/}";
	  if ($master_site eq "MASTER_SITE_SOURCEFORGE") {
	    $homepage = "http://${subdir}.sourceforge.net/";
	  } elsif ($master_site eq "MASTER_SITE_GNU") {
	    $homepage = "http://www.gnu.org/software/${subdir}/";
	  } else {
	    $homepage = substr($url, 0, -length($distfile));
	  }
	} else {
	  $master_sites = "\${${master_site}}";
	}
      }
    }
  }

  if (!$found) {
    if ($url =~ qr"^http://(?:pr)?downloads\.sourceforge\.net/([^/]*)/([^/?]+)(?:\?(?:download|use_mirror=.*))?$") {
      my $pkgbase = $1;
      $distfile = $2;

      $master_sites = "\${MASTER_SITE_SOURCEFORGE:=${pkgbase}/}";
      $homepage = "http://${pkgbase}.sourceforge.net/";
      $found = true;
    }
  }

  if (!$found) {
    if ($url =~ qr"^(.*/)(.*)$") {
      ($master_sites, $distfile) = ($1, $2);
      $homepage = $master_sites;
    } else {
      die("$0: ERROR: Invalid URL: ${url}\n");
    }
  }

  if ($distfile =~ qr"^(.*)(\.tgz|\.tar\.Z|\.tar\.gz|\.tar\.bz2)$") {
    ($distname, $dist_sufx) = ($1, $2);
  } elsif ($distfile =~ qr"^(.*)(\.[^.]+)$") {
    ($distname, $dist_sufx) = ($1, $2);
  } else {
    ($distname, $dist_sufx) = ($distfile, "# none");
  }

  # ignore errors.
  rename("Makefile", "Makefile-url2robotpkg.bak");

  `pwd` =~ qr".*/([^/]+)/[^/]+$" or die;
  $category = $1;

  $gcos = (getpwuid($<))[6];
  $date = strftime "%a %b %e %Y", localtime;
  $year = (localtime())[5] + 1900;

  open(MF, ">", "Makefile") or die;
  print MF <<EOC;
#
# Copyright (c) $year LAAS/CNRS
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
#                                      $gcos on $date
#

EOC

  print_section(*MF, [
		      ["DISTNAME", $distname],
		      ["CATEGORIES", $category],
		      ["MASTER_SITES", $master_sites],
		      ($dist_sufx ne ".tar.gz"
		       ? ["EXTRACT_SUFX", $dist_sufx]
		       : ())
		     ]);
  print_section(*MF, [
		      ["MAINTAINER", get_maintainer()],
		      ["#HOMEPAGE", $homepage],
		      ["#COMMENT", "SHORT_DESCRIPTION_OF_THE_PACKAGE"]
		     ]);
  print MF ("# url2robotpkg-marker (please do not remove this line.)\n");
  print MF ("include ../../mk/robotpkg.mk\n");
  close(MF) or die;

  open(PLIST, ">", "PLIST") or die;
  print PLIST ("\@comment ".localtime()."\n");
  close(PLIST) or die;

  open(DI, ">", "distinfo") or die;
  close(DI) or die;

  open(DESCR, ">", "DESCR") or die;
  close(DESCR) or die;

  run_editor("Makefile", 20);

  print ("url2robotpkg> Running \"make makesum\" ...\n");
  (system { $make } ($make, "makesum")) == 0 or die;
	
  print ("url2robotpkg> Running \"make extract\" ...\n");
  (system { $make } ($make, "extract")) == 0 or die;
}

sub adjust_package_from_extracted_distfiles()
{
  my ($seen_marker);

  chomp($abs_wrkdir = `${make} show-var VARNAME=WRKDIR`);

  #
  # Determine the value of WRKSRC.
  #
  my @files = ();
  opendir(WRKDIR, $abs_wrkdir) or die;
  while (defined(my $f = readdir(WRKDIR))) {
    next if $f =~ qr"^\.";
    push(@files, $f);
  }
  closedir(WRKDIR);
  if (@files == 1) {
    if ($files[0] ne $distname) {
      push(@build_vars, ["WRKSRC", "\${WRKDIR}/$files[0]"]);
    }		
    $abs_wrksrc = "${abs_wrkdir}/$files[0]";
  } elsif ( -d "${abs_wrkdir}/$distname" ) {
    $abs_wrksrc = "${abs_wrkdir}/$distname";
  } else {
    push(@build_vars, ["WRKSRC", "\${WRKDIR}" .
		       ((@files > 1) ? " # More than one possibility --".
			" please check manually." : "")]);
    $abs_wrksrc = $abs_wrkdir;
  }

  chomp(@wrksrc_files = `cd "${abs_wrksrc}" && find * -type f`);
  chomp(@wrksrc_dirs = `cd "${abs_wrksrc}" && find * -type d`);

  magic_configure();
  magic_cmake();
  magic_libtool();
  magic_pkg_config();
  magic_genom();
  magic_use_languages();

  print("url2robotpkg> Adjusting the Makefile.\n");

  open(MF1, "<", "Makefile") or die;
  open(MF2, ">", "Makefile-url2robotpkg.new") or die;

  # Copy the user-edited part of the Makefile.
  while (defined(my $line = <MF1>)) {
    if ($line =~ qr"^# url2robotpkg-marker\b") {
      $seen_marker = true;
      last;
    }
    print MF2 ($line);

    # Note: This is not elegant, but works.
    if (defined($pkgname) && $line =~ qr"^DISTNAME=(\t+)") {
      print MF2 ("PKGNAME=$1${pkgname}\n");
    }
  }

  if (@todo) {
    foreach my $todo (@todo) {
      print MF2 ("# TODO: ${todo}\n");
    }
    print MF2 ("\n");
  }

  my @depend_vars;
  foreach my $bd (@build_depends) {
    push(@depend_vars, ["BUILD_DEPENDS+", $bd]);
  }
  foreach my $d (@depends) {
    push(@depend_vars, ["DEPENDS+", $d]);
  }
  print_section(*MF2, \@depend_vars);

  print_section(*MF2, \@build_vars);
  print_section(*MF2, \@extra_vars);

  foreach my $f (@includes) {
    print MF2 ("include ${f}\n");
  }

  # Copy the rest of the user-edited part of the Makefile.
  while (defined(my $line = <MF1>)) {
    print MF2 ($line);
  }

  close(MF1);
  close(MF2) or die;
  if ($seen_marker) {
    rename("Makefile-url2robotpkg.new", "Makefile") or die;
  } else {
    unlink("Makefile-url2robotpkg.new");
    die("$0: ERROR: didn't find the url2robotpkg marker in the file.\n");
  }	
}

sub main() {
  my $url;

  if (!-f "../../mk/robotpkg.mk") {
    die("$0 must be run from a package directory (.../robotpkg/category/package).");
  }

  my @extract_cookie = <w*/.extract_done>;
  if (scalar(@extract_cookie) == 0) {
    if (scalar(@ARGV) == 0) {
      print("URL: ");
      # Pressing Ctrl-D is considered equivalent to
      # aborting the process.
      if (!defined($url = <STDIN>)) {
	print("\n");
	print("No URL given -- aborting.\n");
	exit(0);
      }
    } else {
      $url = shift(@ARGV);
    }

    generate_initial_package($url);
  } else {
    chomp($distname = `${make} show-var VARNAME=DISTNAME`);
  }

  adjust_package_from_extracted_distfiles();

  print("\n");
  print("Remember to correct CATEGORIES, HOMEPAGE, COMMENT, and DESCR when you're done!\n");
  print("\n");
  print("Good luck! (See robotpkg/README.txt for some more help :-)\n");
}

main();
