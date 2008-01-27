# Copyright (c) 2006-2008 IS/AIST-ST2I/CNRS
#      Joint Japanese-French Robotics Laboratory (JRL).
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
# From $NetBSD: bsd.install-vars.mk,v 1.4 2006/11/04 07:42:51 rillig Exp $
#

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
install: build install-cookie
    else
install: barrier
    endif
  endif
endif

include ${PKGSRCDIR}/mk/install/deinstall.mk
include ${PKGSRCDIR}/mk/install/replace.mk
