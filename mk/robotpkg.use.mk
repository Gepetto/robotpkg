#	$NetBSD: bsd.pkg.use.mk,v 1.36 2006/07/07 14:29:41 jlam Exp $
#
# Turn USE_* macros into proper depedency logic.  Included near the top of
# bsd.pkg.mk, after bsd.prefs.mk.

############################################################################
# ${PREFIX} selection
############################################################################

PREFIX=		${LOCALBASE}

### USE_LIBTOOL, PKG_[SH]LIBTOOL

ifdef USE_LIBTOOL
CONFIGURE_ENV+=         LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
MAKE_ENV+=              LIBTOOL="${LIBTOOL} ${LIBTOOL_FLAGS}"
endif
