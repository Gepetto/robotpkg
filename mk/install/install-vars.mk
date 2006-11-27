# $NetBSD: bsd.install-vars.mk,v 1.4 2006/11/04 07:42:51 rillig Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.install.mk is included.
#
# Package-settable variables:
#
# INSTALLATION_DIRS_FROM_PLIST
#	If set to "yes", the static PLIST files of the package will
#	be used to determine which directories need to be created before
#	the "real" installation should start.
#

# If a package sets INSTALLATION_DIRS, then it's known to pre-create
# all of the directories that it needs at install-time, so we don't need
# mtree to do it for us.
#
ifdef INSTALLATION_DIRS
NO_MTREE=	yes
endif

INSTALLATION_DIRS_FROM_PLIST?=	no
ifneq (,$(call isyes,$(INSTALLATION_DIRS_FROM_PLIST)))
NO_MTREE=	yes
endif

include ${PKGSRCDIR}/mk/install/install.mk
