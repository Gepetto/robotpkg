#	$NetBSD: bsd.pkg.use.mk,v 1.36 2006/07/07 14:29:41 jlam Exp $
#
# Turn USE_* macros into proper depedency logic.  Included near the top of
# bsd.pkg.mk, after bsd.prefs.mk.

############################################################################
# ${PREFIX} selection
############################################################################

PREFIX?=		${LOCALBASE}


# --- USE_LIBTOOL ----------------------------------------------------

#
# PKG_LIBTOOL is the path to the libtool script installed by libtool-base.
# _LIBTOOL is the path the libtool used by the build, which could be the
#	path to a libtool wrapper script.
# LIBTOOL is the publicly-readable variable that should be used by
#	Makefiles to invoke the proper libtool.
#
PKG_LIBTOOL?=		${LOCALBASE}/bin/libtool
_LIBTOOL?=		${PKG_LIBTOOL}
LIBTOOL?=		${PKG_LIBTOOL}

ifdef USE_LIBTOOL
LIBTOOL_REQD?=		1.5.22
BUILD_DEPENDS+=		libtool>=${LIBTOOL_REQD}:../../pkgtools/libtool
CONFIGURE_ENV+=		LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
MAKE_ENV+=		LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
endif
