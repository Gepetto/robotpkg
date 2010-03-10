# $LAAS: toplevel.mk 2010/03/10 00:35:53 tho $
#
# Copyright (c) 2007-2010 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: toplevel.mk,v 1.2 2007/01/07 00:57:36 rillig Exp $
#
#					Anthony Mallet on Thu May 24 2007
#

# This file contains the make targets that can be used from the
# top-level Makefile. They are in this separate file to keep the
# top-level file short and clean.
#

.PHONY: db
db:
	@${RM} -f ${CURDIR}/INDEX
	@${MAKE} ${CURDIR}/INDEX

.PHONY: ${CURDIR}/PKGDB
${CURDIR}/PKGDB:
	@${ECHO_MSG} "Extracting complete dependency database."		\
		"This may take a while..."
	${RUN} DB=${CURDIR}/PKGDB; ROBOTPKG_DIR=${CURDIR};		\
	${RM} -f ${DB};							\
	list=`${AWK} '/SUBDIR/ {					\
		sub("Makefile", "", FILENAME);				\
		sub("[ \t]*SUBDIR[+= \t]*", "");			\
		print FILENAME $$0 }' */Makefile`;			\
	for pkgdir in $$list; do					\
	  if [ ! -d $$pkgdir ]; then					\
	    echo;							\
	    echo "WARNING: the package directory $$pkgdir is listed in"	\
		>/dev/stderr;						\
	    echo $$pkgdir | ${SED} 's;/.*;/Makefile;g' >/dev/stderr;	\
	    echo "but the directory does not exist.  Please fix this!"	\
		>/dev/stderr;						\
	    continue;							\
	  fi;								\
	  cd $$pkgdir;							\
	  l=`${MAKE} print-summary-data`;				\
	  if [ $$? != 0 ]; then						\
	    echo;							\
	    echo "WARNING: the package in $$pkgdir had problem with"	\
		>/dev/stderr;						\
	    echo "  ${MAKE} print-summary-data" >/dev/stderr;		\
	    echo "Database information for this package will be dropped"\
		>/dev/stderr;						\
	    ${MAKE} print-summary-data  2>&1 >/dev/stderr;		\
	    continue;							\
	  fi;								\
	  echo "$$l" >>$$DB;						\
									\
	  ${ECHO_N} ".";						\
	  cd $$ROBOTPKG_DIR;						\
	done;								\
	${ECHO}

${CURDIR}/INDEX:
	${RUN}								\
	${MAKE} ${CURDIR}/PKGDB;					\
	${RM} -f ${CURDIR}/INDEX;					\
	${AWK} -f ./mk/internal/gendb.awk				\
		ROBOTPKG_DIR=${CURDIR} SORT=${SORT} ${CURDIR}/PKGDB;	\
	${RM} -f ${CURDIR}/PKGDB


print-db: ${CURDIR}/INDEX
	${RUN}${AWK} -F\| '{ printf(					\
		"Pkg:\t%s\n"						\
		"Path:\t%s\n"						\
		"Info:\t%s\n"						\
		"Maint:\t%s\n"						\
		"Index:\t%s\n"						\
		"B-deps:\t%s\n"						\
		"R-deps:\t%s\n"						\
		"Arch:\t%s\n\n",					\
		$$1, $$2, $$4, $$6, $$7, $$8, $$9, $$10);		\
	}' < ${CURDIR}/INDEX

search: ${CURDIR}/INDEX
ifndef key
	@${ECHO_MSG} "The search target requires a keyword parameter,"
	@${ECHO_MSG} "e.g.: \"${MAKE} search key=somekeyword\""
else
	${RUN}${GREP} ${key} ${CURDIR}/INDEX | ${AWK} -F\| '{ printf(	\
		"Pkg:\t%s\n"						\
		"Path:\t%s\n"						\
		"Info:\t%s\n"						\
		"Maint:\t%s\n"						\
		"Index:\t%s\n"						\
		"B-deps:\t%s\n"						\
		"R-deps:\t%s\n"						\
		"Arch:\t%s\n\n",					\
		$$1, $$2, $$4, $$6, $$7, $$8, $$9, $$10);		\
	}'
endif
