#	$NetBSD: bsd.pkg.use.mk,v 1.36 2006/07/07 14:29:41 jlam Exp $
#
# Turn USE_* macros into proper depedency logic.  Included near the top of
# bsd.pkg.mk, after bsd.prefs.mk.

############################################################################
# ${PREFIX} selection
############################################################################

PREFIX?=		${LOCALBASE}


# --- USE_PKG_CONFIG -------------------------------------------------

ifdef USE_PKG_CONFIG
PKG_CONFIG?=		${LOCALBASE}/bin/pkg-config
BUILD_DEPENDS+=		pkg-config>=0.23:../../pkgtools/pkg-config
CONFIGURE_ENV+=		PKG_CONFIG="${PKG_CONFIG}"
MAKE_ENV+=		PKG_CONFIG="${PKG_CONFIG}"
endif
