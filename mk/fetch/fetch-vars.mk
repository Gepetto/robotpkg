# $NetBSD: bsd.fetch-vars.mk,v 1.6 2006/07/27 07:41:40 rillig Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.fetch.mk is included.
#
# The following variables may be set by the user:
#
#    DISTDIR is the top-level directory into which all original
#	distribution files are fetched.
#
#    DIST_PATH is a list of directories, separated by colons, in which
#	the distribution files are looked up, additionally to DISTDIR.
#	No files will ever be created in these directories.
#
# The following variables may be set in a package Makefile:
#
#    DIST_SUBDIR is the subdirectory of ${DISTDIR} in which the original
#	distribution files for the package are fetched.
#
#    DISTFILES is the list of distribution files that are fetched.
#

# The default DISTDIR is currently set in bsd.prefs.mk.
#DISTDIR?=               ${PKGSRCDIR}/distfiles

EXTRACT_SUFX?=		.tar.gz

_DISTDIR=		${DISTDIR}/${DIST_SUBDIR}
DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}

include ${PKGSRCDIR}/mk/fetch/sites.mk
include ${PKGSRCDIR}/mk/fetch/fetch.mk
-include "${PKGSRCDIR}/mk/fetch/fetch-list.mk"
-include "${PKGSRCDIR}/mk/fetch/distclean.mk"
