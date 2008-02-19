#
# Copyright (c) 2007 LAAS/CNRS                        --  Tue May 22 2007
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
# From $NetBSD: Makefile,v 1.81 2007/02/20 22:46:32 agc Exp $
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
# This is the top-level Makefile of robotpkg. It contains a list of the
# categories of packages, as well as some targets that operate on the
# whole robotpkg system.
#
# User-settable variables:
#
# SPECIFIC_PKGS
#	(See mk/defaults/mk.conf)
#
#
# See also:
#	mk/misc/toplevel.mk
#

# Note: The tools definitions must come before bsd.prefs.mk is included.

# tools used by this Makefile
#USE_TOOLS+=	[ awk cat cmp echo env expr false fgrep grep mv	rm sed	\
#		sort wc

# additional tools used by bsd.pkg.subdir.mk
#USE_TOOLS+=	basename touch

# additional tools used by bsd.bulk-pkg.mk
#USE_TOOLS+=	egrep find ls sh tee true tsort

ROBOTPKGTOP=	yes

include mk/robotpkg.prefs.mk

SUBDIR+=	architecture
SUBDIR+=	archivers
SUBDIR+=	devel
SUBDIR+=	doc
SUBDIR+=	graphics
SUBDIR+=	image
SUBDIR+=	interfaces
SUBDIR+=	lang
SUBDIR+=	localization
SUBDIR+=	math
SUBDIR+=	meta-pkgs
SUBDIR+=	path
SUBDIR+=	pkgtools
SUBDIR+=	robots
SUBDIR+=	scripts
SUBDIR+=	shell
SUBDIR+=	www

include ${CURDIR}/mk/robotpkg.subdir.mk
