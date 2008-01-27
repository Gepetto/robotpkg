# Copyright (c) 2008 IS/AIST-ST2I/CNRS
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
# From $NetBSD: replace.mk,v 1.10 2007/03/09 03:28:58 rillig Exp $
#
# Public targets:
#
# replace:
#	Updates a package in-place on the system.
#	It will acquire elevated privileges just-in-time.
#
#
# Private targets that must be defined by the package system makefiles:
#
# pkg-replace:
#	Updates a package in-place on the system.

_REPLACE_TARGETS+=	build
_REPLACE_TARGETS+=	replace-message
_REPLACE_TARGETS+=	pkg-replace

#
# replace
#

.PHONY: replace
ifdef _PKGSRC_BARRIER
replace: ${_REPLACE_TARGETS}
else
replace: barrier
endif

.PHONY: replace-message
replace-message:
	@${PHASE_MSG} "Replacing for ${PKGNAME}"
