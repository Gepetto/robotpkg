# $NetBSD: locking.mk,v 1.3 2006/11/09 02:11:44 rillig Exp $
#

# This file provides the following targets:
#
# acquire-lock
#	Acquires a coarse-grained lock in WRKDIR.
#
# release-lock
#	Releases the lock in WRKDIR.
#
# acquire-localbase-lock
#	Acquires a coarse-grained lock in LOCALBASE.
#
# release-localbase-lock
#	Releases the lock in LOCALBASE.
#

_WRKDIR_LOCKFILE=	${WRKDIR}/.lockfile
_LOCALBASE_LOCKFILE=	${LOCALBASE}/.lockfile

#
# The targets.
#

.PHONY: acquire-lock release-lock
.PHONY: acquire-localbase-lock release-localbase-lock

acquire-lock release-lock acquire-localbase-lock release-localbase-lock:
	@${DO_NADA}
