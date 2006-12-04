# $NetBSD: bsd.pkg.update.mk,v 1.7 2006/10/05 12:56:27 rillig Exp $
#
# This Makefile fragment is included by bsd.pkg.mk and contains the targets
# and variables for "make update".
#
# There is no documentation on what "update" actually does.  This is merely
# an attempt to separate the magic into a separate module that can be
# reimplemented later.
#

include ${PKGSRCDIR}/mk/update/update.mk
