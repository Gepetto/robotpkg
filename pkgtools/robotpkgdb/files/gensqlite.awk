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
#                                           Anthony Mallet on Wed Mar 24 2010
#

BEGIN {
    FS="|";

    printf("Generating sqlite database\n");

    if( ROBOTPKG_DIR == "" ) { ROBOTPKG_DIR = "../../../.."; }

    if( SQLITE == "" ) { SQLITE = "sqlite3"; }
    sq = SQLITE " robotpkgdb.sqlite";
    #sq = "cat";

    printf("drop table if exists pkginfo;\n") | sq;
    printf("create table pkginfo(") | sq;
    printf("pkgbase text, ") | sq;
    printf("pkgdir text unique on conflict abort, ") | sq;
    printf("pkgversion text,") | sq;
    printf("comment text,") | sq;
    printf("descr text,") | sq;
    printf("maintainer text,") | sq;
    printf("home text,") | sq;
    printf("onlyfor text,") | sq;
    printf("notfor text,") | sq;
    printf("license text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists depend;\n") | sq;
    printf("create table depend(") | sq;
    printf("pkgbase text, ") | sq;
    printf("type text, ") | sq;
    printf("dep text, ") | sq;
    printf("req text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists distfiles;\n") | sq;
    printf("create table distfiles(") | sq;
    printf("pkgbase text, ") | sq;
    printf("distfile text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists mastersites;\n") | sq;
    printf("create table mastersites(") | sq;
    printf("pkgbase text, ") | sq;
    printf("mastersite text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists masterrepository;\n") | sq;
    printf("create table masterrepository(") | sq;
    printf("pkgbase text, ") | sq;
    printf("scm text,") | sq;
    printf("path text,") | sq;
    printf("element text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists categories;\n") | sq;
    printf("create table categories(") | sq;
    printf("pkgbase text, ") | sq;
    printf("category text") | sq;
    printf(");\n") | sq;

    printf("drop table if exists licences;\n") | sq;
    printf("create table licenses(") | sq;
    printf("name text unique on conflict ignore not null, ") | sq;
    printf("text text") | sq;
    printf(");\n") | sq;

    printf("begin exclusive transaction;") | sq;
}


{
    gsub("'", "''", $4);

    # retrieve the DESCR content
    descr = ""; while ((getline l < $5) > 0) {
	gsub("'", "''", l);
	if (descr != "") { descr = descr "\n" l; } else { descr = l; }
    }
    close($5);

    # retrieve the license text
    if ($16 != "") {
      split($16, licenses, "[ \t]");
      for(l in licenses) {
	  f = ROBOTPKG_DIR "/licenses/" licenses[l];
	  license[l] = ""; while ((getline line < f) > 0) {
	      gsub("'", "''", line);
	      if (license[l] != "") {
		  license[l] = license[l] "\n" line;
	      } else {
		  license[l] = line;
	      }
	  }
	  close(f);
      }
    } else {
      license[1] = "";
    }

    printf("insert into pkginfo values (") | sq;
    printf("'%s',", $1) | sq;
    printf("'%s',", $2) | sq;
    printf("'%s',", $3) | sq;
    printf("'%s',", $4) | sq;
    printf("'%s',", descr) | sq;
    printf("'%s',",  $9) | sq;
    printf("'%s',",  $15) | sq;
    printf("'%s',",  $13) | sq;
    printf("'%s',",  $14) | sq;
    printf("'%s'",  $16) | sq;
    printf(");\n") | sq;

    split($6, dist, "[ \t]");
    for(f in dist) {
	printf("insert into distfiles values (") | sq;
	printf("'%s',", $1) | sq;
	printf("'%s'",  dist[f]) | sq;
	printf(");\n") | sq;
    }

    split($7, site, "[ \t]");
    for(f in site) {
	printf("insert into mastersites values (") | sq;
	printf("'%s',", $1) | sq;
	printf("'%s'",  site[f]) | sq;
	printf(");\n") | sq;
    }

    split($8, repo, "[ \t]");
    printf("insert into masterrepository values (") | sq;
    printf("'%s',", $1) | sq;
    printf("'%s',",  repo[1]) | sq;
    printf("'%s',",  repo[2]) | sq;
    printf("'%s'",  repo[3]) | sq;
    printf(");\n") | sq;

    split($10, cat, "[ \t]");
    for(f in cat) {
	printf("insert into categories values (") | sq;
	printf("'%s',", $1) | sq;
	printf("'%s'",  cat[f]) | sq;
	printf(");\n") | sq;
    }

    split($11, deps, "[ \t]");
    for(dep in deps) {
	insertdep($1, deps[dep], "build");
    }
    for(dep in deps) { delete deps[dep]; }

    split($12, deps, "[ \t]");
    for(dep in deps) {
	insertdep($1, deps[dep], "run");
    }

    for(l in licenses) {
	printf("insert into licenses values (") | sq;
	printf("'%s',", licenses[l]) | sq;
	printf("'%s'", license[l]) | sq;
	printf(");\n") | sq;
    }
}

END {
    printf("commit transaction;") | sq;
    printf("analyze;") | sq;
}


function insertdep(pkg, d, type) {
    if (match(d, "[<>=]")) {
	r[0] = substr(d, 1, RSTART-1);
	r[1] = substr(d, RSTART);
    } else {
	r[0] = d;
	r[1] = "";
    }

    printf("insert into depend values (") | sq;
    printf("'%s',", pkg) | sq;
    printf("'%s',", type) | sq;
    printf("'%s',", r[0]) | sq;
    printf("'%s'", r[1]) | sq;
    printf(");\n") | sq;
}
