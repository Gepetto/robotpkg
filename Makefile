#
# Copyright (c) 2007-2009,2011 LAAS/CNRS
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
# From $NetBSD: Makefile,v 1.81 2007/02/20 22:46:32 agc Exp $
#
#                                       Anthony Mallet on Tue May 22 2007


# This is the top-level Makefile of robotpkg. It contains a list of the
# categories of packages, as well as some targets that operate on the
# whole robotpkg system.
#
# User-settable variables:
#
# SPECIFIC_PKGS
#	(See mk/defaults/mk.conf)
#
# See also:
#	mk/misc/toplevel.mk
#

SUBDIR+=	architecture
SUBDIR+=	archivers
SUBDIR+=	audio
SUBDIR+=	devel
SUBDIR+=	doc
SUBDIR+=	editors
SUBDIR+=	graphics
SUBDIR+=	hardware
SUBDIR+=	image
SUBDIR+=	interfaces
SUBDIR+=	knowledge
SUBDIR+=	lang
SUBDIR+=	localization
SUBDIR+=	manipulation
SUBDIR+=	mapping
SUBDIR+=	math
SUBDIR+=	meta-pkgs
SUBDIR+=	middleware
SUBDIR+=	motion
SUBDIR+=	net
SUBDIR+=	optimization
SUBDIR+=	path
SUBDIR+=	pkgtools
SUBDIR+=	robots
SUBDIR+=	scripts
SUBDIR+=	shell
SUBDIR+=	simulation
SUBDIR+=	speech
SUBDIR+=	supervision
SUBDIR+=	sysutils
SUBDIR+=	www

include mk/robotpkg.subdir.mk
