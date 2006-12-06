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

INSTALLATION_DIRS_FROM_PLIST?=	yes

_COOKIE.install=	${WRKDIR}/.install_done

# --- install (PUBLIC) -----------------------------------------------
#
# install is a public target to install the package.
#
.PHONY: install
ifndef NO_INSTALL
  include ${PKGSRCDIR}/mk/install/install.mk
else
  ifeq (yes,$(call exists,${_COOKIE.install}))
install:
	@${DO_NADA}
  else
    ifdef _PKGSRC_BARRIER
install: ${_PKGSRC_BUILD_TARGETS} install-cookie
    else
install: barrier
    endif
  endif
endif

include ${PKGSRCDIR}/mk/install/deinstall.mk
-include "${PKGSRCDIR}/mk/install/replace.mk"
