#
# Copyright (c) 2011-2012 LAAS/CNRS
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
#                                           Anthony Mallet on Sat Feb 19 2011
#

# This Makefile fragment defines variables related to the bulk target
#
$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)

# Name this session, default to MACHINE_PLATFORM
BULK_TAG?=	$(or ${tag},${MACHINE_PLATFORM})

# Top level directory used for binary package build and installation
BULKBASE?=	/opt/openrobots

# Directory in which log files from the bulk build are kept.
BULK_LOGDIR?=	${LOCALBASE}/var/log/bulk

# Where to log N/A packages (for caching the information between bulks)
BULK_PKGFILENA?=${PACKAGES}/NotAvail/${PKGNAME}
BULK_PKGWILDNA?=${PACKAGES}/NotAvail/${PKGWILDCARD}

# A file wich makes all bulks a noop once created (for clean interruption)
BULK_STOPFILE?=	${BULK_LOGDIR}/STOP

# The package database directory used for installation of bulk-built packages
BULK_DBDIR?=	${BULKBASE}/var/db/robotpkg

# Extra arguments passed to recursive MAKE invocation
BULK_MAKE_ARGS=\
	LOCALBASE=${BULKBASE} PKG_DBDIR=${BULK_DBDIR}		\
	DISTDIR=${WRKDIR}/distfiles DIST_PATH=${DISTDIR}

# Redefinition of pkg_install commands working with bulk-built packages
BULK_PKGTOOLS_ARGS+=	-K ${BULK_DBDIR}

BULK_PKG_ADD?=		${PKG_ADD_CMD} ${BULK_PKGTOOLS_ARGS}
BULK_PKG_ADMIN?=	${PKG_ADMIN_CMD} ${BULK_PKGTOOLS_ARGS}
BULK_PKG_DELETE?=	${PKG_DELETE_CMD} ${BULK_PKGTOOLS_ARGS}
BULK_PKG_INFO?=		${PKG_INFO_CMD} ${BULK_PKGTOOLS_ARGS}

BULK_BESTINSTALLED?=	${PKG_ADMIN} -b -d ${BULK_DBDIR} -S lsbest
BULK_BESTAVAIL?=	${PKG_ADMIN} -d ${PKGREPOSITORY} lsbest

# Ignore those files in BULKBASE when checking leftover files
BULK_FIND_FILES_IGNORE=\
	-path '${MAKECONF}' -o		\
	-path '${ROBOTPKG_DIR}/*' -o	\
	-path '${BULK_DBDIR}/*' -o	\
	-path '${BULK_LOGDIR}/*'

# This file indicated that a binary package must be rebuilt
_COOKIE.bulkoutdated=		${WRKDIR}/.bulk.outdated

override define if-outdated-bulkpkg
$(eval -include ${_COOKIE.bulkoutdated})$(if ${_BULKOUTDATED.${PKGPATH}},$1,$2)
endef


# Package-specific log files
#
_bulklog_meta=		${BULK_LOGDIR}/${PKGNAME}/meta.txt
_bulklog_cbbh=		${WRKDIR}/cbbh.log
_bulklog_cbbhby=	${WRKDIR}/cbbhby.log
_bulklog_brokenby=	${WRKDIR}/brokenby.log
_bulklog_broken=	${WRKDIR}/broken.log
_bulklog_leftover=	${WRKDIR}/plist.log
_bulklog_bulk=		${WRKDIR}/bulk.log

_bulk_date_start:=	$(shell ${DATE} '+%s')
_bulk_date_stop=	$(shell ${DATE} '+%s')

BULK_META?=		${ECHO} >>${_bulklog_meta}
BULK_LEFT?=		${ECHO} >>${_bulklog_leftover}
BULK_CBBH?=		${ECHO} >>${_bulklog_cbbh}
BULK_CBBHBY?=		${ECHO} >>${_bulklog_cbbhby}
BULK_BRKBY?=		${ECHO} >>${_bulklog_brokenby}
BULK_BRK?=\
  ${SH} -c '${ERROR_MSG} "$$@"; ${ECHO} "$$@" >>$$0' ${_bulklog_broken}

override define _bulklog_filter
${_LOGFILTER} -r ${_LOGFILTER_FLAGS} -l ${_bulklog_bulk} -- ${SH}
endef


# Rules for bulk-%
include ${ROBOTPKG_DIR}/mk/bulk/bulk.mk
include ${ROBOTPKG_DIR}/mk/bulk/log.mk
