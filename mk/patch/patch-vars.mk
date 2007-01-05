#
# Copyright (c) 2006 LAAS/CNRS                        --  Thu Dec  7 2006
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
#
# From $NetBSD: bsd.patch-vars.mk,v 1.3 2006/07/13 14:02:34 jlam Exp $
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
#
#   3. All advertising materials mentioning   features or use of this
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

#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.patch.mk is included.
#
# The following variables may be set in a package Makefile:
#
#    PATCHFILES is a list of distribution patches relative to
#	${_DISTDIR} that are applied first to the package.
#
#    PATCHDIR is the location of the pkgsrc patches for the package.
#	This defaults to the "patches" subdirectory of the package
#	directory.
#
# The following variables may be set by the user:
#
#    LOCALPATCHES is the location of local patches that are maintained
#	in a directory tree reflecting the same hierarchy as the pkgsrc
#	tree, e.g., local patches for www/apache would be found in
#	${LOCALPATCHES}/www/apache.  These patches are applied after
#	the patches in ${PATCHDIR}.
#

# The default PATCHDIR is currently set in bsd.prefs.mk
#PATCHDIR?=	${.CURDIR}/patches

#.if (defined(PATCHFILES) && !empty(PATCHFILES)) || \
#    (defined(PATCHDIR) && exists(${PATCHDIR})) || \
#    (defined(LOCALPATCHES) && exists(${LOCALPATCHES}/${PKGPATH}))
USE_TOOLS+=	patch
#.endif

#.if (defined(PATCHDIR) && exists(${PATCHDIR})) || \
#    (defined(LOCALPATCHES) && exists(${LOCALPATCHES}/${PKGPATH}))
#USE_TOOLS+=	digest:bootstrap
#.endif

# These tools are used to output the contents of the distribution patches
# to stdout.
#
ifdef PATCHFILES
USE_TOOLS+=	cat
endif

include ${PKGSRCDIR}/mk/patch/patch.mk
