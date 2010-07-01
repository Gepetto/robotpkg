#
# Copyright (c) 2010 LAAS/CNRS
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
#                                            Anthony Mallet on Wed Mar 24 2010
#

AWK?=	awk
ECHO?=	echo
SORT?=	sort
SQLITE?=sqlite3

ROBOTPKG_DIR?=	../../../..

INSTALL_PROGRAM_DIR?=	install -d
INSTALL_DATA_DIR?=	install -d
INSTALL_PROGRAM?=	install -m 755
INSTALL_DATA?=		install -m 644

PREFIX?=		/opt/openrobots
DBDIR?=			share/robotpkgdb


# --- top level targets ----------------------------------------------------

.PHONY: csv
robotpkgdb.csv csv: PKGDB
	${AWK} -f ./gencsv.awk SORT=${SORT} ./PKGDB

.PHONY: sqlite
robotpkgdb.sqlite sqlite: robotpkgdb.csv
	${AWK} -f ./gensqlite.awk \
		SQLITE=${SQLITE} ROBOTPKG_DIR=${ROBOTPKG_DIR} < robotpkgdb.csv

.PHONY: install-csv
install-csv: robotpkgdb.csv
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/${DBDIR}
	${INSTALL_DATA} robotpkgdb.csv ${DESTDIR}${PREFIX}/${DBDIR}/.

.PHONY: install-sqlite
install-sqlite: robotpkgdb.sqlite
	${INSTALL_PROGRAM_DIR} ${DESTDIR}${PREFIX}/sbin
	${INSTALL_PROGRAM} robotpkg_search ${DESTDIR}${PREFIX}/sbin/.
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/man/man8
	${INSTALL_DATA} robotpkg_search.8 ${DESTDIR}${PREFIX}/man/man8/.
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/${DBDIR}
	${INSTALL_DATA} robotpkgdb.sqlite ${DESTDIR}${PREFIX}/${DBDIR}/.


# --- PKGDB ----------------------------------------------------------------
#
# Gather data from all packages, using the 'print-summary-data' target.
#
# This assumes that the category Makefiles contain lines like
# "SUBDIR+= subdir", with one subdirectory per line.
#
PKGDB:
	@echo "Extracting package summary information."			\
		"This may take a while..."
	@${MAKE} --no-print-directory					\
		-C ${ROBOTPKG_DIR} print-summary-data			\
		PHASE_MSG="${ECHO} >&2 processing"			\
		>$@;
