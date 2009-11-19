#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Sat Oct 24 2009
#

$(call require, ${ROBOTPKG_DIR}/mk/pkg/pkg-vars.mk)
$(call require, ${ROBOTPKG_DIR}/mk/depends/sysdep.mk)


# --- bootstrap-depends (PUBLIC) -------------------------------------------
#
# bootstrap-depends is a public target to install any missing dependencies
# needed during stages before the normal "depends" stage.  These dependencies
# are packages with DEPEND_METHOD.pkg set to bootstrap.
#
_BOOTSTRAPDEPENDS_TARGETS+= cbbh
_BOOTSTRAPDEPENDS_TARGETS+= makedirs
_BOOTSTRAPDEPENDS_TARGETS+= bootstrap-depends-message
_BOOTSTRAPDEPENDS_TARGETS+= pkg-bootstrap-depends
_BOOTSTRAPDEPENDS_TARGETS+= sys-bootstrap-depends

bootstrap-depends: ${_BOOTSTRAPDEPENDS_TARGETS}

.PHONY: bootstrap-depends-message
bootstrap-depends-message:
	@${PHASE_MSG} "Checking bootstrap dependencies for ${PKGNAME}"
