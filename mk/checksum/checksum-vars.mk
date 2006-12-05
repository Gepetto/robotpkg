# $NetBSD: bsd.checksum-vars.mk,v 1.1 2006/07/13 14:02:34 jlam Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.checksum.mk is included.
#
# The following variables may be set in a package Makefile:
#
#    DISTINFO_FILE is the path to file containing the checksums.
#

DISTINFO_FILE?=		${PKGDIR}/distinfo

# The following are the "public" targets provided by this module:
#
#    checksum, makesum, makepatchsum, distinfo
#

# --- checksum, makesum, makepatchsum (PUBLIC) -----------------------
#
# checksum is a public target to checksum the fetched distfiles
# for the package.
#
# makesum is a public target to add checksums of the distfiles for
# the package to ${DISTINFO_FILE}.
#
# makepatchsum is a public target to add checksums of the patches
# for the package to ${DISTINFO_FILE}.
#
ifdef NO_CHECKSUM
.PHONY: checksum makesum makepatchsum
checksum: fetch
        @${DO_NADA}

makesum makepatchsum:
        @${DO_NADA}
else
  include ${PKGSRCDIR}/mk/checksum/checksum.mk
endif


# --- distinfo (PUBLIC) ----------------------------------------------
#
# distinfo is a public target to create ${DISTINFO_FILE}.
#
.PHONY: distinfo
distinfo: makepatchsum makesum
        @${DO_NADA}

# Some short aliases for "makepatchsum" and "distinfo".
.PHONY: mps mdi makedistinfo
mps: makepatchsum
mdi makedistinfo: distinfo
