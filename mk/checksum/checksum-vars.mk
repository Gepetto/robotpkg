# $LAAS: checksum-vars.mk 2008/05/25 23:19:04 tho $
#
# Copyright (c) 2006-2008 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
#   3. All  advertising  materials  mentioning  features or  use of  this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: bsd.checksum-vars.mk,v 1.1 2006/07/13 14:02:34 jlam Exp $
#
#					Anthony Mallet on Thu Dec  7 2006
#

# The following variables may be set in a package Makefile:
#
#    DISTINFO_FILE is the path to file containing the checksums.
#

DISTINFO_FILE?=		${PKGDIR}/distinfo

# The following are the "public" targets provided by this module:
#
#    checksum, makesum, makepatchsum, distinfo
#

# --- checksum, makesum, makepatchsum (PUBLIC) -----------------------
#
# checksum is a public target to checksum the fetched distfiles
# for the package.
#
# makesum is a public target to add checksums of the distfiles for
# the package to ${DISTINFO_FILE}.
#
# makepatchsum is a public target to add checksums of the patches
# for the package to ${DISTINFO_FILE}.
#
ifdef NO_CHECKSUM
.PHONY: checksum makesum makepatchsum
checksum: fetch
	@${DO_NADA}

makesum makepatchsum:
	@${DO_NADA}
else
  include ${ROBOTPKG_DIR}/mk/checksum/checksum.mk
endif


# --- distinfo (PUBLIC) ----------------------------------------------
#
# distinfo is a public target to create ${DISTINFO_FILE}.
#
.PHONY: distinfo
distinfo: makepatchsum makesum
	@${DO_NADA}

# Some short aliases for "makepatchsum" and "distinfo".
.PHONY: mps mdi makedistinfo
mps: makepatchsum
mdi makedistinfo: distinfo
